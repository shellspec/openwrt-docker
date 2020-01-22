FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.1/targets/x86/64/
ENV file=openwrt-18.06.1-x86-64-generic-rootfs.tar.gz
ENV sha256=8e66a308fac92baca36af3f83a3af05e5a51d93b0f98b6c6d4683ee868d52cd2
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
