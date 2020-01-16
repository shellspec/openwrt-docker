#IMPORT https://downloads.openwrt.org/releases/19.07.0-rc1/targets/x86/64/openwrt-19.07.0-rc1-x86-64-generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-19.07.0-rc1-x86-64-generic-rootfs.tar.gz /
CMD /bin/sh
