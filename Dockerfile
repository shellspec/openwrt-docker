FROM alpine as builder
ENV base=https://archive.openwrt.org/barrier_breaker/14.07/x86/generic/
ENV file=openwrt-x86-generic-Generic-rootfs.tar.gz
ENV md5=121dcfac982e6ae06d6714233cf0c772
RUN wget -q "$base$file" && echo "$md5  $file" | md5sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
