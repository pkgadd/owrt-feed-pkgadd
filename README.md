# owrt-feed-pkgadd
Additional source packages for OpenWrt

## Description

Installation of pre-built packages is handled directly by the **opkg** utility within your running OpenWrt system or by using the [OpenWrt SDK](https://openwrt.org/docs/guide-developer/obtain.firmware.sdk) on a build system.

## Usage

This repository is intended to be layered on-top of an OpenWrt buildroot. If you do not have an OpenWrt buildroot installed, see the documentation at: [Quick Image Building Guide](https://openwrt.org/docs/guide-developer/quickstart-build-images) on the OpenWrt support site.

This feed needs to be added to the global [feeds.conf.default](https://github.com/openwrt/openwrt/blob/master/feeds.conf.default).
```
src-git pkgadd https://github.com/pkgadd/owrt-feed-pkgadd.git
```

To install all its package definitions, run:
```
./scripts/feeds update pkgadd
./scripts/feeds install -a -p pkgadd
```

## License

See [LICENSE](LICENSE) file.
 
## Package Guidelines

See [CONTRIBUTING.md](CONTRIBUTING.md) file.
