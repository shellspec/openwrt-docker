#IMPORT https://archive.openwrt.org/backfire/10.03/x86/openwrt-x86-rootfs.tgz
FROM scratch
ADD imports/openwrt-x86-rootfs.tgz /
CMD /bin/sh
