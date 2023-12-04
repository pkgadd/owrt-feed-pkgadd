#
# Copyright (C) 2023 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the GPLv2 (only) License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=wifi-suite
PKG_SOURCE_DATE:=2023-12-04
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=GPL-2.0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/wifi-suite
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+hostapd-utils
  TITLE:=Show used ciphers of all connected Wi-Fi clients
  PKGARCH:=all
endef

define Package/wifi-suite/description
  Parse hostapd's state information to inquire the actual encryption ciphers
  chosen between AP and its connected STAs.
endef

define Build/Compile
endef

define Package/wifi-suite/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/wifi-suite.sh $(1)/usr/sbin/wifi-suite
endef

$(eval $(call BuildPackage,wifi-suite))
