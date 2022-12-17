FROM tmp/tmp-toolchain:latest as image-1
FROM rust:1.65.0-slim-bullseye
# openssl
WORKDIR /opt/

COPY --from=image-1 /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
COPY --from=image-1 /opt/openssl-1.0.2u /opt/openssl-1.0.2u


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 perl make wget cmake ninja-build g++ gcc xz-utils -y
ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/ STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc
ENV MACHINE=mips SYSTEM=Linux ARCH=mips
WORKDIR /opt/openssl-1.0.2u
RUN ./config shared --prefix=/opt/openssl-1.0.2u-uclibc --cross-compile-prefix=mipsel-openwrt-linux-uclibc- no-asm &&  \
    mkdir /opt/openssl-1.0.2u-uclibc  &&\
    make -j4  &&\
    make install && \
    rm -rf /opt/openssl-1.0.2u