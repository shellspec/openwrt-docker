#IMPORT https://archive.openwrt.org/chaos_calmer/15.05.1/x86/generic/openwrt-15.05.1-x86-generic-Generic-rootfs.tar.gz
FROM scratch
ADD imports/openwrt-15.05.1-x86-generic-Generic-rootfs.tar.gz /
CMD /bin/sh
