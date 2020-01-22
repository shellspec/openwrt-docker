FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.5/targets/x86/64/
ENV file=lede-17.01.5-x86-64-generic-rootfs.tar.gz
ENV sha256=6989c773950772d79da9c5a5c2df13e530e3a1aee41b9f08d81173fe0899621b
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
