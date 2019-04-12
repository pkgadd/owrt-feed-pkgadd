#
# Copyright (C) 2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=strongswan-slh
PKG_SOURCE_DATE:=2019-04-11
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=ISC
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/strongswan-slh
  SUBMENU:=VPN
  SECTION:=net
  CATEGORY:=Network
  TITLE:=meta package installing strongswan
  PKGARCH:=all
  DEPENDS:= \
	+openssl-util \
	+strongswan \
	+strongswan-default \
	+strongswan-mod-addrblock \
	+strongswan-mod-ccm \
	+strongswan-mod-cmac \
	+strongswan-mod-ctr \
	+strongswan-mod-curve25519 \
	+strongswan-mod-dhcp \
	+strongswan-mod-eap-identity \
	+strongswan-mod-eap-md5 \
	+strongswan-mod-eap-mschapv2 \
	+strongswan-mod-eap-tls \
	+strongswan-mod-gcm \
	+strongswan-mod-hmac \
	+strongswan-mod-openssl \
	+strongswan-mod-xauth-eap \
	+strongswan-ipsec \
	+strongswan-pki
endef

define Package/strongswan-slh/description
  Meta package for a custom selection of strongswan packages.
endef

define Build/Compile
endef

define Package/strongswan-slh/install
	:
endef

$(eval $(call BuildPackage,strongswan-slh))
