FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.3/targets/x86/64/
ENV file=openwrt-18.06.3-x86-64-generic-rootfs.tar.gz
ENV sha256=c03db7278f84bca67d2ab84421fa80324a48a7d0392949447b995dd4cff7823e
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
