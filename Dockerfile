FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.2/targets/x86/64/
ENV file=openwrt-18.06.2-x86-64-generic-rootfs.tar.gz
ENV sha256=80258f2aa876c3696c3044d24891f340492b92232142160d967879b272cd25bb
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
