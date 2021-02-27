FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.7/targets/x86/64/
ENV file=openwrt-19.07.7-x86-64-generic-rootfs.tar.gz
ENV sha256=02cd917022deb6e95bdd72fa36bbb8921da4e83f646510a6cd26efbea6eea2c3
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
