#IMPORT https://archive.openwrt.org/barrier_breaker/14.07/x86/generic/openwrt-x86-generic-Generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-x86-generic-Generic-rootfs.tar.gz /
CMD /bin/sh
