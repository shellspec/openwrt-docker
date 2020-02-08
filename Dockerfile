FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.7/targets/x86/64/
ENV file=openwrt-18.06.7-x86-64-generic-rootfs.tar.gz
ENV sha256=4a1dcdf685db21677146b7aae7cd45ddde5c152af549681814af971f75d3325c
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
