#IMPORT https://archive.openwrt.org/attitude_adjustment/12.09/x86/generic/openwrt-x86-generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-x86-generic-rootfs.tar.gz /
CMD /bin/sh
