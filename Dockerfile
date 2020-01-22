FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.4/targets/x86/64/
ENV file=openwrt-18.06.4-x86-64-generic-rootfs.tar.gz
ENV sha256=adf9875c2532ea70fc4aea8dc6a2e730176edabb91f2670e39f7ef57f3135585
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
