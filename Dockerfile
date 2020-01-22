FROM alpine as builder
ENV base=https://archive.openwrt.org/backfire/10.03.1/x86_generic/
ENV file=openwrt-x86-generic-rootfs.tar.gz
ENV md5=7877521cf04cf67257c0c871c1d661f8
RUN wget -q "$base$file" && echo "$md5  $file" | md5sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
