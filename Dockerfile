FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.4/targets/x86/64/
ENV file=openwrt-19.07.4-x86-64-generic-rootfs.tar.gz
ENV sha256=0714d1a2b1e182a208e1f952b17398d54b72b062881030143ba4c3bcbaf0a50e
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
