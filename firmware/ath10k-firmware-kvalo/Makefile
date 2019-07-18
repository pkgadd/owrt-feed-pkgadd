#
# Copyright (C) 2015 OpenWrt.org
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ath10k-firmware-kvalo
PKG_SOURCE_DATE:=2019-06-28
PKG_SOURCE_VERSION:=7651f5bb299c40e34e05179b1bd15b211856a4b0
PKG_MIRROR_HASH:=386953eb48ce1d8a851e1cc2595d59592aef162b781d150c67bca6989fd45e63
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kvalo/ath10k-firmware.git

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ath10k-kvalo-firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=$(PKG_SOURCE_URL)
  DEPENDS:=
  PKGARCH:=all
endef

define Package/ath10k-firmware-qca9887-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA9887 devices (kvalo git)
  PROVIDES:=ath10k-firmware-qca9887
endef

define Package/ath10k-firmware-qca9888-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA9888 devices (kvalo git)
  PROVIDES:=ath10k-firmware-qca9888
endef

define Package/ath10k-firmware-qca988x-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA988x devices (kvalo git)
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=ath10k-firmware-qca988x
endef

define Package/ath10k-firmware-qca99x0-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA99x0 devices (kvalo git)
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=ath10k-firmware-qca99x0
endef

define Package/ath10k-firmware-qca99x0-kvalo/description
Standard ath10k firmware for QCA99x0 from QCA
This firmware conflicts with the CT 99x0 firmware, so select only
one.
endef

define Package/ath10k-firmware-qca9984-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA9984 devices (kvalo git)
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=ath10k-firmware-qca9984
endef

define Package/ath10k-firmware-qca4019-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for IPQ/QCA4019 devices (kvalo git)
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=ath10k-firmware-qca4019
endef

define Package/ath10k-firmware-qca6174-kvalo
$(Package/ath10k-kvalo-firmware-default)
  TITLE:=ath10k firmware for QCA6174 devices (kvalo git)
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=ath10k-firmware-qca6174
endef

QCA99X0_BOARD_REV:=ddcec9efd245da9365c474f513a855a55f3ac7fe
QCA99X0_BOARD_FILE:=board-2.bin.$(QCA99X0_BOARD_REV)

define Download/qca99x0-board
  URL:=https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0
  URL_FILE:=board-2.bin?id=$(QCA99X0_BOARD_REV)
  FILE:=$(QCA99X0_BOARD_FILE)
  HASH:=03711ac21e60ef59d3815e235eb721c0c22851b5410299411085aa6f2af45401
endef
$(eval $(call Download,qca99x0-board))

define Build/Compile

endef

define Package/ath10k-firmware-qca4019-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA4019/hw1.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA4019/hw1.0/board-2.bin \
		$(1)/lib/firmware/ath10k/QCA4019/hw1.0/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA4019/hw1.0/3.6/firmware-5.bin_10.4-3.6-00140 \
		$(1)/lib/firmware/ath10k/QCA4019/hw1.0/firmware-5.bin
endef

define Package/ath10k-firmware-qca9887-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA9887/hw1.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9887/hw1.0/10.2.4-1.0/firmware-5.bin_10.2.4-1.0-00045 \
		$(1)/lib/firmware/ath10k/QCA9887/hw1.0/firmware-5.bin
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9887/hw1.0/board.bin \
		$(1)/lib/firmware/ath10k/QCA9887/hw1.0/board.bin
endef

define Package/ath10k-firmware-qca9888-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA9888/hw2.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9888/hw2.0/board-2.bin \
		$(1)/lib/firmware/ath10k/QCA9888/hw2.0/board-2.bin
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9888/hw2.0/3.9.0.2/firmware-5.bin_10.4-3.9.0.2-00040 \
		$(1)/lib/firmware/ath10k/QCA9888/hw2.0/firmware-5.bin
endef

define Package/ath10k-firmware-qca988x-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA988X/hw2.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA988X/hw2.0/board.bin \
		$(1)/lib/firmware/ath10k/QCA988X/hw2.0/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA988X/hw2.0/10.2.4-1.0/firmware-5.bin_10.2.4-1.0-00045 \
		$(1)/lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin
endef

define Package/ath10k-firmware-qca6174-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA6174/hw2.1
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA6174/hw2.1/board-2.bin \
		$(1)/lib/firmware/ath10k/QCA6174/hw2.1/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA6174/hw2.1/firmware-5.bin_SW_RM.1.1.1-00157-QCARMSWPZ-1 \
		$(1)/lib/firmware/ath10k/QCA6174/hw2.1/firmware-5.bin
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA6174/hw3.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA6174/hw3.0/board-2.bin \
		$(1)/lib/firmware/ath10k/QCA6174/hw3.0/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA6174/hw3.0/4.4.1.c3/firmware-6.bin_WLAN.RM.4.4.1.c3-00031 \
		$(1)/lib/firmware/ath10k/QCA6174/hw3.0/firmware-6.bin
endef

define Package/ath10k-firmware-qca99x0-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA99X0/hw2.0
	$(INSTALL_DATA) \
		$(DL_DIR)/$(QCA99X0_BOARD_FILE) \
		$(1)/lib/firmware/ath10k/QCA99X0/hw2.0/board-2.bin
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA99X0/hw2.0/boardData_AR900B_CUS239_5G_v2_001.bin \
		$(1)/lib/firmware/ath10k/QCA99X0/hw2.0/board.bin
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA99X0/hw2.0/firmware-5.bin_10.4.1.00030-1 \
		$(1)/lib/firmware/ath10k/QCA99X0/hw2.0/firmware-5.bin
endef

define Package/ath10k-firmware-qca9984-kvalo/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA9984/hw1.0
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9984/hw1.0/board-2.bin \
		$(1)/lib/firmware/ath10k/QCA9984/hw1.0/board-2.bin
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/QCA9984/hw1.0/3.10/firmware-5.bin_10.4-3.10-00047 \
		$(1)/lib/firmware/ath10k/QCA9984/hw1.0/firmware-5.bin
endef

$(eval $(call BuildPackage,ath10k-firmware-qca9887-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca9888-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca988x-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca99x0-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca6174-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca9984-kvalo))
$(eval $(call BuildPackage,ath10k-firmware-qca4019-kvalo))
