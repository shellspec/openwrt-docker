FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.0-rc1/targets/x86/64/
ENV file=openwrt-18.06.0-rc1-x86-64-generic-rootfs.tar.gz
ENV sha256=04368639bf0e74d4c764bc44b6f442b25689f8c4675a7fd77169fdd68f5679c3
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
