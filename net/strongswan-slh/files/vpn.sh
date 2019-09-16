#!/bin/sh

# Based on https://github.com/escalade/LEDE/blob/escalade/files/usr/sbin/vpn.sh

# Copyright: (C) 2017-2019, Stefan Lippers-Hollmann <s.l-h@gmx.de>

# License: ISC
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

CADIR="/etc/CA"
CACERT="${CADIR}/caCert.pem"
CAKEY="${CADIR}/caKey.pem"
SERVERCERT="${CADIR}/serverCert.pem"
SERVERKEY="${CADIR}/serverKey.pem"
KEYSIZE="4096"
DAYS="1825"

buildca () {
	mkdir -p "${CADIR}"

	ipsec pki \
		--gen \
		--outform pem \
		-s "${KEYSIZE}" \
			>"${CAKEY}"

	ipsec pki \
		--self \
		--lifetime "${DAYS}" \
		--in "${CAKEY}" \
		--dn "CN=LEDE CA ($(uci get system.@system[0].hostname))" \
		--ca \
		--outform pem \
			>"${CACERT}"

	ln -sf "${CACERT}" /etc/ipsec.d/cacerts/
}

buildserver () {
	# Create key/cert

	if [ ! -d "${CADIR}" ]; then
		echo "${CADIR} doesn't exist, run \"${0} buildca\" first."
		exit 1
	fi

	ipsec pki \
		--gen \
		--outform pem \
		-s "${KEYSIZE}" \
			>"${SERVERKEY}"

	ipsec pki \
		--pub \
		--in "${SERVERKEY}" | \
			ipsec pki \
				--issue \
				--lifetime "${DAYS}" \
				--cacert "${CACERT}" \
				--cakey "${CAKEY}" \
				--dn "CN=${1}" \
				--san="${1}" \
				--flag serverAuth \
				--flag ikeIntermediate \
				--outform pem \
					>"${SERVERCERT}"

	# Create symlink for key/cert in strongSwan directories
	ln -sf "${SERVERKEY}"  /etc/ipsec.d/private/
	ln -sf "${SERVERCERT}" /etc/ipsec.d/certs/

	# Change leftid
	if [ -w /etc/ipsec.conf ]; then
		sed -i "s/leftid.*/leftid=${1}/" /etc/ipsec.conf
	fi
}

buildclient () {
	# Create key/cert
	CLIENTKEY="${CADIR}/${1}Key.pem"
	CLIENTCERT="${CADIR}/${1}Cert.pem"
	CLIENTP12="${CADIR}/${1}.p12"

	if [ ! -d "${CADIR}" ]; then
		echo "${CADIR} doesn't exist, run \"${0} buildca\" first."
		exit 1
	fi

	ipsec pki \
		--gen \
		--outform pem \
		-s "${KEYSIZE}" \
			>"${CLIENTKEY}"

	ipsec pki \
		--pub \
		--in "${CLIENTKEY}" | \
			ipsec pki \
				--issue \
				--lifetime "${DAYS}" \
				--cacert "${CACERT}" \
				--cakey "${CAKEY}" \
				--dn "CN=${1}" \
				--san "${1}" \
				--flag clientAuth \
				--outform pem \
					>"${CLIENTCERT}"

	openssl pkcs12 \
		-export \
		-out "${CADIR}/${1}.p12" \
		-inkey "${CLIENTKEY}" \
		-in "${CLIENTCERT}" \
		-certfile "${CACERT}"

	ln -sf "${CLIENTCERT}" /etc/ipsec.d/certs/
}

generate_sswan () {
	cat >"${CADIR}/${2}.sswan" <<EOF
{
	"uuid": "$(cat /proc/sys/kernel/random/uuid)",
	"name": "${1}",
	"type": "ikev2-cert-eap",
	"remote": {
		"addr": "${1}"
	},
	"local": {
		"p12": "$(openssl enc -base64 -A -in ${CADIR}/${2}.p12)"
	}
}
EOF
}

clean_CA () {
	rm -rf "${CADIR}"
	find "/etc/ipsec.d/" -type l -exec rm -f {} \;
	find "/etc/ipsec.d/" -type f -exec rm -f {} \;
}

case $1 in
	buildca)
		buildca > /dev/null 2>&1
		echo "CA built in ${CADIR}."
		echo "Certificate is available at ${CADIR}/caCert.pem"
		;;
	buildserver)
		if [ -z "${2}" ]; then
			echo "No ddns_name specified."
			echo "Usage: ${0} buildserver [ddns_name]"
			exit 0
		fi

		buildserver "${2}" >/dev/null 2>&1
		echo "Server certificate for ${2} built"
		echo "You should restart ipsec as needed"
		;;
	buildclient)
		if [ -z "${2}" ]; then
			echo "No ddns name specified."
			echo "Usage: ${0} buildclient [ddns_name] [client]"
			exit 0
		fi

		if [ -z "${3}" ]; then
			echo "No client name specified."
			echo "Usage: ${0} buildclient [client]"
			exit 0
		fi

		buildclient "${3}" >/dev/null 2>&1
		echo "PKCS12 certificate bundle is available at ${CADIR}/${3}.p12"

		generate_sswan "${2}" "${3}" >/dev/null 2>&1
		echo "strongswan android client profile is available at ${CADIR}/${3}.sswan"
		;;
	clean)
		clean_CA
		;;
	*)
		echo "Usage: ${0} [buildca|buildserver|buildclient|clean]"
		echo "${0} clean"
		echo "${0} buildca"
		echo "${0} buildserver [ddns_name]"
		echo "${0} buildclient [ddns_name] [client]"
		;;
esac

