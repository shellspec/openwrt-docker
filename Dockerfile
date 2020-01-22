FROM alpine as builder
ENV base=https://archive.openwrt.org/chaos_calmer/15.05/x86/generic/
ENV file=openwrt-15.05-x86-generic-Generic-rootfs.tar.gz
ENV sha256=bd0c20c7db2be0b7ccf9c1b0a430b3f4401e7a2cfb272568e8e727a55da809a9
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
