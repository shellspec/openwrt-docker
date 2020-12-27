FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.5/targets/x86/64/
ENV file=openwrt-19.07.5-x86-64-generic-rootfs.tar.gz
ENV sha256=8a0fb9498d7dcd795b52492f203d99d4fb1300d289c11b8ff3d9f7dd0ded15ea
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
