#
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=nbg6817-tools
PKG_SOURCE_DATE:=2021-04-03
PKG_RELEASE:=$(AUTORELEASE)
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pkgadd/nbg6817
PKG_SOURCE_VERSION:=b60d3a01a22a0508689377ef045f3d6546e015e6
PKG_MIRROR_HASH:=02169c8a2d838d409168d8f3d2e322adc91fb787a22aea9d166dfa88cf6818fe

PKG_LICENSE:=ISC
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/nbg6817-tools
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@TARGET_ipq806x
  TITLE:=Toggle dualflag for the nbg6817
  PKGARCH:=all
endef

define Package/nbg6817-tools/description
  Scripts to select the boot partition set on the ZyXEL NBG6817.
endef

define Build/Compile
endef

define Package/nbg6817-tools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nbg6817-dualboot $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,nbg6817-tools))
