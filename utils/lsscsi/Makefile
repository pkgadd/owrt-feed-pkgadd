#
# Copyright (C) 2021 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lsscsi
PKG_VERSION:=0.32
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://sg.danny.cz/scsi/
PKG_HASH:=0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING


PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lsscsi
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=List all SCSI devices (or hosts) currently on system
  URL:=https://sg.danny.cz/scsi/lsscsi.html
endef

define Package/lsscsi/description
 Uses information in sysfs (Linux kernels 2.6.0 and later) to list all
 scsi devices (or hosts) currently attached to the system. Options can
 be used to control the amount and form of information provided for each
 device.
endef

define Package/lsscsi/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
endef

$(eval $(call BuildPackage,lsscsi))
