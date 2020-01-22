FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.7/targets/x86/64/
ENV file=lede-17.01.7-x86-64-generic-rootfs.tar.gz
ENV sha256=d934d0c4fadc7cbbdb297a8603d3c8691ef2299cd91f7cad934d580f402b0005
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
