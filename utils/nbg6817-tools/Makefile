#
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=nbg6817-tools
PKG_SOURCE_DATE:=2025-08-25
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pkgadd/nbg6817
PKG_SOURCE_VERSION:=7f1314c281fe4a3c28ba3bc61195dcce83b8e268
PKG_MIRROR_HASH:=8838eb1f595d6a51ad483b9d151a4e170c7b9b805daa0fd140c036328fa2897e

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
