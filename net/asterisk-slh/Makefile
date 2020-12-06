#
# Copyright (C) 2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-slh
PKG_SOURCE_DATE:=2019-05-06
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=ISC
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/asterisk-slh
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=meta package installing asterisk
  PKGARCH:=all
  DEPENDS:= \
	+asterisk \
	+asterisk-app-verbose \
	+asterisk-bridge-simple \
	+asterisk-cdr-csv \
	+asterisk-chan-lantiq \
	+asterisk-codec-a-mu \
	+asterisk-codec-alaw \
	+asterisk-codec-g722 \
	+asterisk-codec-g726 \
	+asterisk-codec-ulaw \
	+asterisk-pjsip \
	+asterisk-res-pjproject \
	+asterisk-res-rtp-asterisk \
	+asterisk-res-sorcery
endef

define Package/asterisk-slh/description
  Meta package for a custom selection of asterisk packages.
endef

define Build/Compile
endef

define Package/asterisk-slh/install
	:
endef

$(eval $(call BuildPackage,asterisk-slh))
