#
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=nbg6817-tools
PKG_SOURCE_DATE:=2021-04-03
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pkgadd/nbg6817
PKG_SOURCE_VERSION:=b60d3a01a22a0508689377ef045f3d6546e015e6
PKG_MIRROR_HASH:=8c753ee539556b95571ca262e3dcedc39acc7825bfaeca2f83a41cacdd84a0ad

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
