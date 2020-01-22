FROM alpine as builder
ENV base=https://archive.openwrt.org/chaos_calmer/15.05.1/x86/generic/
ENV file=openwrt-15.05.1-x86-generic-Generic-rootfs.tar.gz
ENV sha256=766e3c165b326460d96220cf5c325cd5a0fead5f2bca7454dbbc6bd9e1197878
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
