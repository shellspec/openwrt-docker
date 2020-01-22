FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/17.01.2/targets/x86/64/
ENV file=lede-17.01.2-x86-64-generic-rootfs.tar.gz
ENV sha256=dd13620f8d5de4b471666e2a4ce56de22f7b2dab7f89c3dc999e6a34155a8816
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
