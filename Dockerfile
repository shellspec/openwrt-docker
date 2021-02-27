FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.6/targets/x86/64/
ENV file=openwrt-19.07.6-x86-64-generic-rootfs.tar.gz
ENV sha256=56ea54cec104c9082199b0c465ba53ca985ebd627483b03ff4d9c8376a851ec1
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
