FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.6/targets/x86/64/
ENV file=lede-17.01.6-x86-64-generic-rootfs.tar.gz
ENV sha256=0dd07aae2a89262decd7df94d66817a1ca27e10d8c6e20cfd4765a5cb27a9414
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
