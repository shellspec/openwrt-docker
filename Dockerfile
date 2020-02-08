FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/19.07.1/targets/x86/64/
ENV file=openwrt-19.07.1-x86-64-generic-rootfs.tar.gz
ENV sha256=023c32c4c9a744c3a11f28d7bd720d72b14ede05352ae7e8eaf61611b126c21a
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
