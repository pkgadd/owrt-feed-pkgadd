#
# Copyright (C) 2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-slh
PKG_SOURCE_DATE:=2019-04-11
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
	+asterisk15 \
	+asterisk15-app-verbose \
	+asterisk15-bridge-simple \
	+asterisk15-cdr-csv \
	+asterisk15-chan-lantiq \
	+asterisk15-codec-a-mu \
	+asterisk15-codec-alaw \
	+asterisk15-codec-g722 \
	+asterisk15-codec-g726 \
	+asterisk15-codec-ulaw \
	+asterisk15-pjsip \
	+asterisk15-res-pjproject \
	+asterisk15-res-rtp-asterisk \
	+asterisk15-res-sorcery
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
