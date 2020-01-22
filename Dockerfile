FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.5/targets/x86/64/
ENV file=openwrt-18.06.5-x86-64-generic-rootfs.tar.gz
ENV sha256=bd6718057ae3f951bceb63e915d2de1465940004da8e7121f23e61f005e786d8
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
