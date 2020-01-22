FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.4/targets/x86/64/
ENV file=lede-17.01.4-x86-64-generic-rootfs.tar.gz
ENV sha256=43886c6b4a555719603286ceb1733ea2386d43b095ab0da9be35816cd2ad8959
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
