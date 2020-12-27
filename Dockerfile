FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.9/targets/x86/64/
ENV file=openwrt-18.06.9-x86-64-generic-rootfs.tar.gz
ENV sha256=c2390b5deee9bdd9d49a9764776acb685166664387c92bfd3e7c21f45712f768
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
