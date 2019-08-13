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
	+luci-app-uhttpd

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+luci-app-adblock

  # Support for IETF BCP38
  DEPENDS+= \
	+luci-app-bcp38

  # USB device mount & filesystem support
  DEPENDS+= \
	+blockd \
	+kmod-usb-storage \
	+kmod-usb-storage-uas \
	+kmod-fs-ext4 \
	+kmod-fs-f2fs \
	+kmod-fs-vfat \
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

  # htop
  DEPENDS+= \
	+htop

  # ip-full
  DEPENDS+= \
	+ip-full

  # Debugging options
  DEPENDS+= \
	+kmod-ikconfig

  # Adblock package with Luci support, initially disabled
  DEPENDS+= \
	+tcpdump-mini

  # tftp-hpa
  DEPENDS+= \
	+tftpd-hpa
endef

define Package/slh-misc-16m/description
  Meta package for a custom selection of default package set for 16 MB flash devices.
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
	+collectd-mod-cpufreq \
	+collectd-mod-entropy \
	+collectd-mod-ping \
	+collectd-mod-snmp \
	+collectd-mod-thermal \
	+collectd-mod-uptime \
	+collectd-mod-wireless

  # only available on selected targets
  DEPENDS+= \
	+TARGET_x86:collectd-mod-cpufreq
	+TARGET_x86_64:collectd-mod-cpufreq
	+TARGET_mvebu:collectd-mod-cpufreq
	+TARGET_ipq806x:collectd-mod-cpufreq
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

  ## pull in luci-statistics
  #DEPENDS:= \
  #	+slh-misc-luci-statistics

  # wifischedule support for Luci
  DEPENDS:= \
	+luci-app-wifischedule

  # USB tethering support
  DEPENDS+= \
	+kmod-usb-net \
	+kmod-usb-net-cdc-ether \
	+kmod-usb-net-rndis

  # i18n-de support for Luci
  DEPENDS+= \
	+luci-i18n-base-de \
	+luci-i18n-base-en \
	+luci-i18n-ddns-de \
	+luci-i18n-firewall-de \
	+luci-i18n-opkg-de \
	+luci-i18n-p910nd-de \
	+luci-i18n-statistics-de \
	+luci-i18n-wifischedule-de \
	+luci-i18n-wol-de
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
$(eval $(call BuildPackage,slh-misc-luci-statistics))
$(eval $(call BuildPackage,slh-misc-qos))
$(eval $(call BuildPackage,roen-misc-meta))
