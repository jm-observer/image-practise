FROM tmp/tmp-toolchain:latest AS build-1
FROM tmp/tmp-llvm:latest AS build-3
FROM rust:1.65.0-slim-bullseye
# rust
RUN dpkg --add-architecture i386 && \
      apt-get update
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 pkg-config libssl-dev vim tree file openssh-client perl make wget tree python3 curl cmake gcc ninja-build g++ git -y
COPY --from=build-1 /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
COPY --from=build-3 /opt/llvm   /opt/llvm
COPY --from=build-1 /opt/rust   /opt/rust

COPY mipsel-uclibc-openssl/config.toml /opt/config.toml

ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/
ENV STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
ENV CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc

WORKDIR /opt/rust
RUN mv /opt/config.toml /opt/rust/config.toml &&  \
    ./x.py install -j4
RUN rm -rm /opt/rust && rm -rf /opt/rust1.65.0/share && \
    rm -rf /opt/rust1.65.0/libexec && \
    rm -rf /opt/rust1.65.0/etc