#
# Copyright (C) 2018-2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=infobash
PKG_VERSION:=3.60
PKG_RELEASE:=$(AUTORELEASE)
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/fullstory/infobash
PKG_SOURCE_VERSION:=ec96c60a243675b72593fb7762a95e1c34d6ded5
PKG_MIRROR_HASH:=f5f639a2cf67fc77680a2e2fd565b86bc10ce8028285b3ab12731da757648720

PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=debian/copyright
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/infobash
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bash +gawk +pciutils
  TITLE:=System info script
  PKGARCH:=all
endef

define Package/infobash/description
  Infobash is a system information script for IRC (Internet Relay Chat) clients.
  A system information script can display all kinds of things about your
  hardware and software to users in a chatroom,  so they can help you diagnose
  problems, ... or just marvel at your system specs and kernel version ;)
  It was created to serve the need for a infoscript that isn't dependent on a
  particular irc client. Because most irc clients support the /exec command, a
  script that runs with /exec would be most portable.
endef

define Build/Compile
endef

define Package/infobash/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/infobash $(1)/usr/bin/
endef

$(eval $(call BuildPackage,infobash))
