#
# Copyright (C) 2019-2024 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=slh-misc-meta
PKG_SOURCE_DATE:=2025-05-10
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=ISC
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/slh-misc-8m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 8 MB flash devices.
  PKGARCH:=all

  # DSA debugging
  DEPENDS:= \
	+netifd-netinfo

  # Luci (SSL, default SSL provider)
  DEPENDS+= \
	+luci \
	+luci-app-uhttpd

  # Support for IETF BCP38
  DEPENDS+= \
	+luci-app-bcp38

  # USB device mount & filesystem support
  DEPENDS+= \
	+blockd \
	+kmod-usb-storage \
	+kmod-usb-storage-uas \
	+kmod-fs-ext4 \
	+kmod-nls-utf8 \
	+kmod-usb2

  # p910nd support for USB printers
  DEPENDS+= \
	+luci-app-p910nd \
	+kmod-usb-printer

  # Dynamic DNS support
  DEPENDS+= \
	+luci-app-ddns \
	+ddns-scripts-noip

  # wireguard (needs qrencode)
  DEPENDS+= \
	+luci-proto-wireguard
endef

define Package/slh-misc-8m/description
  Meta package for a custom selection of default package set for 8 MB flash devices.
endef

define Package/slh-misc-16m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 16 MB flash devices
  PKGARCH:=all

  # include slh-misc-8m
  DEPENDS:= \
	+slh-misc-8m

  # Luci (SSL from OpenSSL)
  DEPENDS+= \
	+luci-ssl-openssl \
	+luci-theme-bootstrap \
	+luci-theme-openwrt-2020

  # SSL certificates
  DEPENDS+= \
	+ca-certificates

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+luci-app-adblock

  # apk-openssl
  DEPENDS+= \
	+apk-openssl

  # Debugging options
  DEPENDS+= \
	+kmod-ikconfig

  # exfat-utils
  DEPENDS+= \
	+eject \
	+kmod-fs-exfat \
	+exfat-fsck

  # htop
  DEPENDS+= \
	+htop

  # IPv6 support
  DEPENDS+= \
	+6in4

  # DSA helpers
  DEPENDS+= \
	+ip-bridge \
	+ip-full

  # bandwidth monitoring support for Luci
  DEPENDS+= \
	+luci-app-nlbwmon

  # tftp-hpa
  DEPENDS+= \
	+tftpd-hpa

  # umdns
  DEPENDS+= \
	+umdns

  # wireguard (needs qrencode)
  DEPENDS+= \
	+qrencode

  # WLAN support
  DEPENDS+= \
	+hostapd-utils \
	+wifi-suite \
	+wpa-cli

  # WoL support for Luci
  DEPENDS+= \
	+luci-app-wol
endef

define Package/slh-misc-16m/description
  Meta package for a custom selection of default package set for 16 MB flash devices.
endef

define Package/slh-misc-32m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 32 MB flash devices
  PKGARCH:=all

  # include slh-misc-16m
  DEPENDS:= \
	+slh-misc-16m

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+tcpdump-mini

  # banip
  DEPENDS+= \
	+luci-app-banip

  # diffutils
  DEPENDS+= \
	+diffutils

  # ethtool
  DEPENDS+= \
	+ethtool-full

  # exfat-utils
  DEPENDS+= \
	+exfat-mkfs

  # ntfs-3g
  DEPENDS+= \
	+TARGET_x86:kmod-fs-ntfs3 \
	+TARGET_x86_64:kmod-fs-ntfs3 \
	+TARGET_mediatek:kmod-fs-ntfs3 \
	+TARGET_ipq40xx:kmod-fs-ntfs3 \
	+TARGET_ipq806x:kmod-fs-ntfs3 \
	+TARGET_qualcommax:kmod-fs-ntfs3 \
	+TARGET_ath79:kmod-fs-ntfs3
	#lantiq
	#realtek

  # sftp support
  DEPENDS+= \
	+openssh-sftp-server

  # USB tethering support
  DEPENDS+= \
	+kmod-usb-net-rndis
endef

define Package/slh-misc-32m/description
  Meta package for a custom selection of default package set for 32 MB flash devices.
endef

define Package/slh-misc-luci-statistics
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing Luci statistics
  PKGARCH:=all

  # Luci statistics
  DEPENDS:= \
	+luci-app-statistics \
	+collectd-mod-conntrack \
	+collectd-mod-ping \
	+collectd-mod-snmp \
	+collectd-mod-thermal \
	+collectd-mod-uptime \
	+collectd-mod-wireless

  # only available on selected targets
  DEPENDS+= \
	+TARGET_x86:collectd-mod-cpufreq \
	+TARGET_x86_64:collectd-mod-cpufreq \
	+TARGET_mediatek:collectd-mod-cpufreq \
	+TARGET_mvebu:collectd-mod-cpufreq \
	+TARGET_ipq40xx:collectd-mod-cpufreq \
	+TARGET_ipq806x:collectd-mod-cpufreq \
	+TARGET_qualcommax:collectd-mod-cpufreq \
	+TARGET_armvirt:collectd-mod-cpufreq

  # only install on higher-end targets
  DEPENDS+= \
	+TARGET_x86:collectd-mod-sqm \
	+TARGET_x86_64:collectd-mod-sqm \
	+TARGET_mediatek:collectd-mod-sqm \
	+TARGET_mvebu:collectd-mod-sqm \
	+TARGET_ipq40xx:collectd-mod-sqm \
	+TARGET_ipq806x:collectd-mod-sqm \
	+TARGET_qualcommax:collectd-mod-sqm
endef

define Package/slh-misc-luci-statistics/description
  Meta package for a custom selection of Luci statistics.
endef

define Package/slh-misc-qos
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing QoS support
  PKGARCH:=all

  # SQM
  DEPENDS:= \
	+luci-app-sqm \
	+sqm-scripts
endef

define Package/slh-misc-qos/description
  Meta package for a custom selection of QoS support packages.
endef

define Package/roen-misc-meta
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing RoEns default packages
  PKGARCH:=all

  # i18n-de support for Luci
  DEPENDS+= \
	+luci-i18n-adblock-de \
	+luci-i18n-banip-de \
	+luci-i18n-base-de \
	+luci-i18n-bcp38-de \
	+luci-i18n-ddns-de \
	+luci-i18n-firewall-de \
	+luci-i18n-nlbwmon-de \
	+luci-i18n-p910nd-de \
	+luci-i18n-package-manager-de \
	+luci-i18n-statistics-de \
	+luci-i18n-uhttpd-de \
	+luci-i18n-wol-de
endef

define Package/roen-misc-meta/description
  Meta package for a custom selection of RoEns default packages.
endef

define Build/Compile
endef

define Package/slh-misc-8m/install
	:
endef

define Package/slh-misc-16m/install
	:
endef

define Package/slh-misc-32m/install
	:
endef

define Package/slh-misc-luci-statistics/install
	:
endef

define Package/slh-misc-qos/install
	:
endef

define Package/roen-misc-meta/install
	:
endef

$(eval $(call BuildPackage,slh-misc-8m))
$(eval $(call BuildPackage,slh-misc-16m))
$(eval $(call BuildPackage,slh-misc-32m))
$(eval $(call BuildPackage,slh-misc-luci-statistics))
$(eval $(call BuildPackage,slh-misc-qos))
$(eval $(call BuildPackage,roen-misc-meta))
