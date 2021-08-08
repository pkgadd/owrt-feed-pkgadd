#
# Copyright (C) 2021 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=netifd-netinfo
PKG_SOURCE_DATE:=2021-08-08
PKG_RELEASE:=$(AUTORELEASE)
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=GPL-2.0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/netifd-netinfo
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=netifd jshn
  TITLE:=Show status information for DSA bridges
  PKGARCH:=all
endef

define Package/netifd-netinfo/description
  Help debugging DSA bridge configurations using ubus and netifd.
endef

define Build/Compile
endef

define Package/netifd-netinfo/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/netifd-netinfo.sh $(1)/usr/sbin/netifd-netinfo
endef

$(eval $(call BuildPackage,netifd-netinfo))
