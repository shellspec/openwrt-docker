FROM alpine as builder
ENV base=https://archive.openwrt.org/backfire/10.03/x86/
ENV file=openwrt-x86-rootfs.tgz
ENV md5=7ca95c1f390b18af966b457007b32b60
RUN wget -q "$base$file" && echo "$md5  $file" | md5sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
