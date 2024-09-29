#
# Copyright (C) 2014 OpenWrt.org
# Copyright (C) 2024 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# rtl8192dufw.bin is supposed to be added by RealTek to linux-firmware soon,
# provide v39 of the firmware (the shipped rtl8192dufw.bin is v38) until it's
# merged formally.

include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8192du-firmware
PKG_VERSION:=20240908
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8192du.git
PKG_SOURCE_VERSION:=b65f87820526cd8835c5cac19fd7e659c84e8215
PKG_MIRROR_HASH:=skip

include $(INCLUDE_DIR)/package.mk

RSTRIP:=:
STRIP:=:

define Package/firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=https://github.com/lwfinger/rtl8192du.git
  TITLE:=$(1)
  DEPENDS:=$(2)
  LICENSE_FILES:=$(3)
  LICENSE:=$(4)
endef

define Build/Compile
	$(RM) -rf $(PKG_BUILD_DIR)/FW_OUT
	mkdir -p $(PKG_BUILD_DIR)/FW_OUT
	$(CP) ./files/* $(PKG_BUILD_DIR)/FW_OUT
	$(CC) -Wall -I$(PKG_BUILD_DIR)/include/ -o $(PKG_BUILD_DIR)/FW_OUT/header2bin $(PKG_BUILD_DIR)/FW_OUT/header2bin.c
	cd $(PKG_BUILD_DIR)/FW_OUT && ./header2bin
endef

Package/rtl8192du-firmware = $(call Package/firmware-default,RealTek RTL8192DU firmware,,LICENCE.rtlwifi_firmware.txt)
define Package/rtl8192du-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/rtlwifi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/FW_OUT/rtl8192dufw.bin $(1)/lib/firmware/rtlwifi
endef
$(eval $(call BuildPackage,rtl8192du-firmware))
