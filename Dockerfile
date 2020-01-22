FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.0/targets/x86/64/
ENV file=openwrt-18.06.0-x86-64-generic-rootfs.tar.gz
ENV sha256=1eb0731291135e5b5abfc6db530afe1c79f5d2556e157b632429e0149a97895c
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
