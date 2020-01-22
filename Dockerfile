FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.0-rc1/targets/x86/64/
ENV file=lede-17.01.0-rc1-r3042-ec095b5-x86-64-generic-rootfs.tar.gz
ENV sha256=861991b3b290a961bc5603492d3805ba07e9b2c1ccd17cbb5b24b49c5af70b51
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
