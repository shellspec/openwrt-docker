FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.0/targets/x86/64/
ENV file=lede-17.01.0-r3205-59508e3-x86-64-generic-rootfs.tar.gz
ENV sha256=a2d79c79110a7c62f6e4a14be95cefac9decab295e0cc41a35a7b4cacde2f0ca
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
