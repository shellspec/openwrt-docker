FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.0-rc2/targets/x86/64/
ENV file=lede-17.01.0-rc2-r3131-42f3c1f-x86-64-generic-rootfs.tar.gz
ENV sha256=723bae883b09e8a14181a356f72dcfb93297df8f73b33839884f3b38d999f5cd
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
