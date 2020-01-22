FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.0-rc2/targets/x86/64/
ENV file=openwrt-18.06.0-rc2-x86-64-generic-rootfs.tar.gz
ENV sha256=6889ae0396fd7cc6c5ca134ab630514145021d906010370ff653b574ba7ba061
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
