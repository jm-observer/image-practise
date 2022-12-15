FROM rust:1.65.0-slim-bullseye

WORKDIR /opt/
# 'openssh-client' for 'scp'
RUN dpkg --add-architecture i386 && \
      apt-get update
RUN apt-get install git -y
# rust-uclibc-toolchain && toolchain
WORKDIR /opt/
RUN git clone -b 1.65.0 --depth 1 https://github.com/rust-lang/rust.git
WORKDIR /opt/rust
RUN git submodule init && \
  git submodule foreach --recursive 'git rev-parse HEAD | xargs -I {} git fetch origin {} && git reset --hard FETCH_HEAD'  && \
  git submodule update --recursive

RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 pkg-config libssl-dev vim tree file openssh-client perl make wget tree python3 curl cmake gcc ninja-build g++ -y

# toolchain
WORKDIR /opt/
COPY toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z /opt/
RUN tar -xvf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z
ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/
ENV STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
ENV CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc
# rust - compile
WORKDIR /opt/rust
COPY config.toml /opt/rust/
RUN ./x.py build -j8
RUN ./x.py install
RUN rustup toolchain link uclibc /opt/rust1.65.0 && rustup default uclibc
ENV CARGO_TARGET_MIPSEL_UNKNOWN_LINUX_UCLIBC_LINKER=mipsel-openwrt-linux-uclibc-gcc
ENV CARGO_BUILD_TARGET=mipsel-unknown-linux-uclibc

# openssl
WORKDIR /opt/
RUN wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz --no-check-certificate
RUN tar -xvf /opt/openssl-1.0.2u.tar.gz
WORKDIR /opt/openssl-1.0.2u
ENV MACHINE=mips
ENV SYSTEM=Linux
ENV ARCH=mips
RUN ./config shared --prefix=/opt/openssl-1.0.2u-uclibc --cross-compile-prefix=mipsel-openwrt-linux-uclibc- no-asm
RUN mkdir /opt/openssl-1.0.2u-uclibc  &&\
    make -j4  &&\
    make install
ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_INCLUDE_DIR="/opt/openssl-1.0.2u-uclibc/include"
ENV MIPSEL_UNKNOWN_LINUX_UCLIBC_OPENSSL_LIB_DIR="/opt/openssl-1.0.2u-uclibc/lib"


RUN rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/rust && \
    rm -rf /opt/openssl-1.0.2u.tar.gz && \
    rm -rf /opt/openssl-1.0.2u

# /usr/local/cargo/registry
WORKDIR /root/src