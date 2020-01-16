#IMPORT https://archive.openwrt.org/backfire/10.03.1/x86_generic/openwrt-x86-generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-x86-generic-rootfs.tar.gz /
CMD /bin/sh
