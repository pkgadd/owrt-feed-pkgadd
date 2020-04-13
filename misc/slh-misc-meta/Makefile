#
# Copyright (C) 2019 Stefan Lippers-Hollmann <s.l-h@gmx.de>
#
# This is free software, licensed under the ISC License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=slh-misc-meta
PKG_SOURCE_DATE:=2019-05-27
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Lippers-Hollmann <s.l-h@gmx.de>

PKG_LICENSE:=ISC
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/slh-misc-8m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 8 MB flash devices.
  PKGARCH:=all

  # IPv6 support
  DEPENDS:= \
	+6in4

  # Luci (SSL from OpenSSL)
  DEPENDS+= \
	+luci-ssl-openssl \
	+luci-app-uhttpd \
	+luci-theme-bootstrap \
	+luci-theme-openwrt-2020

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+luci-app-adblock

  # Support for IETF BCP38
  DEPENDS+= \
	+luci-app-bcp38

  # USB device mount & filesystem support
  DEPENDS+= \
	+blockd \
	+eject \
	+kmod-usb-storage \
	+kmod-usb-storage-uas \
	+!LINUX_4_19:kmod-fs-exfat \
	+LINUX_4_19:kmod-fs-exfat0 \
	+kmod-fs-ext4 \
	+kmod-nls-utf8 \
	+kmod-usb2

  # p910nd support for USB printers
  DEPENDS+= \
	+luci-app-p910nd \
	+kmod-usb-printer

  # bandwidth monitoring support for Luci
  DEPENDS+= \
	+luci-app-nlbwmon

  # SSL certificates
  DEPENDS+= \
	+ca-certificates

  # Dynamic DNS support
  DEPENDS+= \
	+luci-app-ddns \
	+ddns-scripts_no-ip_com

  # WoL support for Luci
  DEPENDS+= \
	+luci-app-wol

  # WLAN support
  DEPENDS+= \
	+wpa-cli \
	+hostapd-utils

  # opkg
  DEPENDS+= \
	+opkg
endef

define Package/slh-misc-8m/description
  Meta package for a custom selection of default package set for 8 MB flash devices.
endef

define Package/slh-misc-16m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 16 MB flash devices
  PKGARCH:=all

  # include slh-misc-8m
  DEPENDS:= \
	+slh-misc-8m

  # exfat-utils
  DEPENDS+= \
	+exfat-fsck

  # htop
  DEPENDS+= \
	+htop

  # ip-full
  DEPENDS+= \
	+ip-full

  # Debugging options
  DEPENDS+= \
	+kmod-ikconfig
endef

define Package/slh-misc-16m/description
  Meta package for a custom selection of default package set for 16 MB flash devices.
endef

define Package/slh-misc-32m
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing default package set for 32 MB flash devices
  PKGARCH:=all

  # include slh-misc-16m
  DEPENDS:= \
	+slh-misc-16m

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+tcpdump-mini

  # banip
  DEPENDS+= \
	+luci-app-banip

  # diffutils
  DEPENDS+= \
	+diffutils

  # exfat-utils
  DEPENDS+= \
	+exfat-mkfs

  # ntfs-3g
  DEPENDS+= \
	+ntfs-3g \
	+ntfs-3g-utils

  # tftp-hpa
  DEPENDS+= \
	+tftpd-hpa

  # wireguard (needs qrencode)
  DEPENDS+= \
	+luci-app-wireguard \
	+qrencode
endef

define Package/slh-misc-32m/description
  Meta package for a custom selection of default package set for 32 MB flash devices.
endef

define Package/slh-misc-luci-statistics
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing Luci statistics
  PKGARCH:=all

  # Luci statistics
  DEPENDS:= \
	+luci-app-statistics \
	+collectd-mod-conntrack \
	+collectd-mod-entropy \
	+collectd-mod-ping \
	+collectd-mod-snmp \
	+collectd-mod-thermal \
	+collectd-mod-uptime \
	+collectd-mod-wireless

  # only available on selected targets
  DEPENDS+= \
	+TARGET_x86:collectd-mod-cpufreq \
	+TARGET_x86_64:collectd-mod-cpufreq \
	+TARGET_mvebu:collectd-mod-cpufreq \
	+TARGET_ipq40xx:collectd-mod-cpufreq \
	+TARGET_ipq806x:collectd-mod-cpufreq \
	+TARGET_armvirt:collectd-mod-cpufreq
endef

define Package/slh-misc-luci-statistics/description
  Meta package for a custom selection of Luci statistics.
endef

define Package/slh-misc-qos
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing QoS support
  PKGARCH:=all

  # SQM
  DEPENDS:= \
	+luci-app-sqm \
	+sqm-scripts-extra
endef

define Package/slh-misc-qos/description
  Meta package for a custom selection of QoS support packages.
endef

define Package/roen-misc-meta
  SECTION:=misc
  CATEGORY:=misc
  TITLE:=meta package installing RoEns default packages
  PKGARCH:=all

  # pull in luci-statistics
  DEPENDS:= \
  	+slh-misc-luci-statistics

  # wifischedule support for Luci
  DEPENDS+= \
	+luci-app-wifischedule

  # USB tethering support
  DEPENDS+= \
	+kmod-usb-net \
	+kmod-usb-net-cdc-ether \
	+kmod-usb-net-rndis

  # i18n-de support for Luci
  DEPENDS+= \
	+luci-i18n-adblock-de \
	+luci-i18n-adblock-en \
	+luci-i18n-banip-de \
	+luci-i18n-banip-en \
	+luci-i18n-base-de \
	+luci-i18n-base-en \
	+luci-i18n-bcp38-de \
	+luci-i18n-bcp38-en \
	+luci-i18n-ddns-de \
	+luci-i18n-ddns-en \
	+luci-i18n-firewall-de \
	+luci-i18n-firewall-en \
	+luci-i18n-mwan3-de \
	+luci-i18n-mwan3-en \
	+luci-i18n-nlbwmon-de \
	+luci-i18n-nlbwmon-en \
	+luci-i18n-opkg-de \
	+luci-i18n-opkg-en \
	+luci-i18n-p910nd-de \
	+luci-i18n-p910nd-en \
	+luci-i18n-sqm-de \
	+luci-i18n-sqm-en \
	+luci-i18n-statistics-de \
	+luci-i18n-statistics-en \
	+luci-i18n-uhttpd-de \
	+luci-i18n-uhttpd-en \
	+luci-i18n-wifischedule-de \
	+luci-i18n-wifischedule-en \
	+luci-i18n-wireguard-de \
	+luci-i18n-wireguard-en \
	+luci-i18n-wol-de \
	+luci-i18n-wol-en
endef

define Package/roen-misc-meta/description
  Meta package for a custom selection of RoEns default packages.
endef

define Build/Compile
endef

define Package/slh-misc-8m/install
	:
endef

define Package/slh-misc-16m/install
	:
endef

define Package/slh-misc-32m/install
	:
endef

define Package/slh-misc-luci-statistics/install
	:
endef

define Package/slh-misc-qos/install
	:
endef

define Package/roen-misc-meta/install
	:
endef

$(eval $(call BuildPackage,slh-misc-8m))
$(eval $(call BuildPackage,slh-misc-16m))
$(eval $(call BuildPackage,slh-misc-32m))
$(eval $(call BuildPackage,slh-misc-luci-statistics))
$(eval $(call BuildPackage,slh-misc-qos))
$(eval $(call BuildPackage,roen-misc-meta))
