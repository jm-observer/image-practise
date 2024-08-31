FROM tmp/tmp-toolchain:latest as image-1
FROM rust:1.65.0-slim-bullseye
# openssl
WORKDIR /opt/

COPY --from=image-1 /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x
COPY mipsel-uclibc-openssl/03-llvm/config.toml /opt/config.toml
COPY --from=image-1 /opt/rust /opt/rust

ENV PATH=$PATH:/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/bin/ STAGING_DIR=/opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x CC_mipsel_unknown_linux_uclibc=mipsel-openwrt-linux-uclibc-gcc
WORKDIR /opt/rust
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 pkg-config libssl-dev vim tree file openssh-client perl make wget tree python3 curl cmake gcc ninja-build g++ git -y && \
    mv /opt/config.toml /opt/rust/config.toml && \
    ./x.py build src/llvm-project && \
    mv /opt/rust/build/x86_64-unknown-linux-gnu/llvm /opt/llvm &&  \
    rm -rf /opt/rust

#root@ac778922760b:/opt/llvm# ls
#bin  include  lib  llvm-finished-building  share
