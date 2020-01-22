FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.1/targets/x86/64/
ENV file=lede-17.01.1-x86-64-generic-rootfs.tar.gz
ENV sha256=0497c14194c27a278be106277bfd829e16440104459f732333f5ef53f67fe3eb
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
