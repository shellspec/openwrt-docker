FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.2/targets/x86/64/
ENV file=openwrt-19.07.2-x86-64-generic-rootfs.tar.gz
ENV sha256=d8212e5e3d1625c537a1286664beefc53143aa0f2bd7943aa8990fe54ac3d2e3
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
