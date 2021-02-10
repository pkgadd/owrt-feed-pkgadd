#
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=nbg6817-tools
PKG_SOURCE_DATE:=2019-03-28
PKG_RELEASE:=$(AUTORELEASE)
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pkgadd/nbg6817
PKG_SOURCE_VERSION:=f2a334a1af8df5b66b3bd76449767d196fc6f21e
PKG_MIRROR_HASH:=4ff5da0b0c21766503cace47a553d2da8681b1296ac2a5b8953bb3b4542a65c0

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
