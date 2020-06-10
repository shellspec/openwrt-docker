FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.3/targets/x86/64/
ENV file=openwrt-19.07.3-x86-64-generic-rootfs.tar.gz
ENV sha256=336dc70669bb8c1fd9fb64a8375e736dd7795a81c66a5a456a5f671f6bf8ef93
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
