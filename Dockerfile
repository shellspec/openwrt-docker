FROM alpine as builder
ENV base=https://archive.openwrt.org/attitude_adjustment/12.09/x86/generic/
ENV file=openwrt-x86-generic-rootfs.tar.gz
ENV md5=aaf949136756b085175317f8be034e54
RUN wget -q "$base$file" && echo "$md5  $file" | md5sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
