FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.0-rc2/targets/x86/64/
ENV file=openwrt-19.07.0-rc2-x86-64-generic-rootfs.tar.gz
ENV sha256=0910f4c4c0aa009117ecd97bb0d047d53229f58a889c905525f62b64595ab666
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
