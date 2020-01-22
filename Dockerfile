FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.0-rc1/targets/x86/64/
ENV file=openwrt-19.07.0-rc1-x86-64-generic-rootfs.tar.gz
ENV sha256=d80f9e457efe4d710b3845346f82c0e0982d2d53d2ac624e816b23d80ba91061
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
