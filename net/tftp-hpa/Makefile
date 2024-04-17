#
# Copyright (C) 2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tftp-hpa
PKG_VERSION:=5.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@KERNEL/software/network/tftp/$(PKG_NAME)
PKG_HASH:=afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b

PKG_LICENSE:=BSD-4-Clause
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tftp-hpa/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=TFTP
endef

define Package/tftp-hpa
  $(call Package/tftp-hpa/Default)
  TITLE+= client
endef

define Package/tftpd-hpa
  $(call Package/tftp-hpa/Default)
  TITLE+= server
endef

CONFIGURE_ARGS += \
	--without-tcpwrappers \
	--without-remap \
	--without-readline

ifneq ($(CONFIG_IPV6),y)
CONFIGURE_ARGS += \
	--without-ipv6
endif

define Package/tftpd-hpa/conffiles
/etc/config/tftpd-hpa
endef

define Package/tftp-hpa/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tftp/tftp $(1)/usr/bin/tftp-hpa
endef

define Package/tftpd-hpa/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tftpd/tftpd $(1)/usr/sbin/tftpd-hpa
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tftpd-hpa.init $(1)/etc/init.d/tftpd-hpa
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/tftpd-hpa.config $(1)/etc/config/tftpd-hpa
endef

$(eval $(call BuildPackage,tftp-hpa))
$(eval $(call BuildPackage,tftpd-hpa))
