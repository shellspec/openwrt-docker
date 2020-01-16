#IMPORT https://downloads.openwrt.org/releases/18.06.0-rc2/targets/x86/64/openwrt-18.06.0-rc2-x86-64-generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-18.06.0-rc2-x86-64-generic-rootfs.tar.gz /
CMD /bin/sh
