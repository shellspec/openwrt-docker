FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.0/targets/x86/64/
ENV file=openwrt-19.07.0-x86-64-generic-rootfs.tar.gz
ENV sha256=ddceb591c09223e0aeb8a588bf039b3ef6a63bf84d58bda3b5a963ef25fcd3a4
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
