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
	+asterisk16 \
	+asterisk16-app-verbose \
	+asterisk16-bridge-simple \
	+asterisk16-cdr-csv \
	+asterisk16-chan-lantiq \
	+asterisk16-codec-a-mu \
	+asterisk16-codec-alaw \
	+asterisk16-codec-g722 \
	+asterisk16-codec-g726 \
	+asterisk16-codec-ulaw \
	+asterisk16-pjsip \
	+asterisk16-res-pjproject \
	+asterisk16-res-rtp-asterisk \
	+asterisk16-res-sorcery
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
