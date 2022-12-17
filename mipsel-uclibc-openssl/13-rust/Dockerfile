FROM tmp/tmp-toolchain:latest as image-1
FROM tmp/tmp-openssl-upx:latest AS build-2

FROM rust:1.65.0-slim-bullseye
# openssl
WORKDIR /opt/

COPY --from=image-1 /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
COPY --from=build-2 /opt/openssl-1.0.2u-uclibc /opt/openssl-1.0.2u-uclibc

COPY mipsel-uclibc-openssl/13-rust/config.toml /opt/config.toml
ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/ STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 pkg-config libssl-dev vim tree file openssh-client perl make wget tree python3 curl cmake gcc ninja-build g++ git -y
RUN git clone -b 1.65.0 --depth 1 https://github.com/rust-lang/rust.git
WORKDIR /opt/rust
RUN git submodule update --recursive  --init --depth 1 && \
    mv /opt/config.toml /opt/rust/config.toml

WORKDIR /opt/rust
RUN ./x.py install -j4

RUN rustup toolchain link uclibc /opt/rust1.65.0 && rustup default uclibc


ENV CARGO_TARGET_MIPSEL_UNKNOWN_LINUX_UCLIBC_LINKER=mipsel-openwrt-linux-uclibc-gcc
ENV CARGO_BUILD_TARGET=mipsel-unknown-linux-uclibc

ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_INCLUDE_DIR="/opt/openssl-1.0.2u-uclibc/include"
ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_LIB_DIR="/opt/openssl-1.0.2u-uclibc/lib"



