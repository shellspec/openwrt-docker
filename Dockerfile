FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.6/targets/x86/64/
ENV file=openwrt-18.06.6-x86-64-generic-rootfs.tar.gz
ENV sha256=aeae84b8b5aa2c90cbfd8f5b7fdf3789f1cc46a4b5e30bf02510ea0b9031a858
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
