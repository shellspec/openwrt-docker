FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.3/targets/x86/64/
ENV file=lede-17.01.3-x86-64-generic-rootfs.tar.gz
ENV sha256=0f9049c22f77719badfa90aeb87f01ae048b3702662163cebeb61c859c6b7882
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
