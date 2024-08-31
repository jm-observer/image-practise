FROM tmp/tmp-toolchain:latest AS build-1
FROM tmp/tmp-openssl-upx:latest AS build-2
FROM tmp/tmp-rust:latest AS build-4

FROM rust:1.65.0-slim-bullseye
COPY --from=build-1 /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
COPY --from=build-1 /opt/upx-3.95-amd64_linux/upx /usr/bin/upx
COPY --from=build-2 /opt/openssl-1.0.2u-uclibc /opt/openssl-1.0.2u-uclibc
COPY --from=build-4 /opt/rust1.65.0 /opt/rust1.65.0

ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/
ENV STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
ENV CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc

RUN rustup toolchain link uclibc /opt/rust1.65.0 && rustup default uclibc && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 pkg-config libssl-dev vim tree file wget tree curl gcc git && \
    git config --global credential.helper store && \
    ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cp -f /opt/rust1.65.0/bin/cargo /usr/local/cargo/bin/ && \
    apt-get clean && \
    apt-get remove -y

ENV CARGO_TARGET_MIPSEL_UNKNOWN_LINUX_UCLIBC_LINKER=mipsel-openwrt-linux-uclibc-gcc
ENV CARGO_BUILD_TARGET=mipsel-unknown-linux-uclibc

ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_INCLUDE_DIR="/opt/openssl-1.0.2u-uclibc/include"
ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_LIB_DIR="/opt/openssl-1.0.2u-uclibc/lib"

WORKDIR /root/src