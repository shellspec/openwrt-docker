FROM alpine as builder
ENV base=https://downloads.openwrt.org/releases/18.06.8/targets/x86/64/
ENV file=openwrt-18.06.8-x86-64-generic-rootfs.tar.gz
ENV sha256=63deb82a8d95484d76544c1996362c285487857e1fa9f72ad9dfa479f3a960c7
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
