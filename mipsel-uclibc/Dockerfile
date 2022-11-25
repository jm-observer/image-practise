FROM rust:1.65.0-slim-bullseye

RUN mkdir /home/rust
WORKDIR /opt/
COPY toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z /opt/
RUN tar -xvf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z

COPY rust-openwrt-toolchain.tar /opt/
RUN tar -xvf /opt/rust-openwrt-toolchain.tar && \
    rm -rf /opt/rust-openwrt-toolchain.tar

RUN rustup toolchain link uclibc /opt/rust1.65.0 && rustup default uclibc

COPY resource/upx /usr/local/bin/upx
RUN chmod +x /usr/local/bin/upx

# 'openssh-client' for 'scp'
RUN dpkg --add-architecture i386 && \
      apt-get update && \
      apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 file openssh-client -y

ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/
ENV STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
ENV CARGO_TARGET_MIPSEL_UNKNOWN_LINUX_UCLIBC_LINKER=mipsel-openwrt-linux-uclibc-gcc
ENV CARGO_BUILD_TARGET=mipsel-unknown-linux-uclibc

# /usr/local/cargo/registry
WORKDIR /home/rust/src