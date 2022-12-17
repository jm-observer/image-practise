FROM rust:1.65.0-slim-bullseye
# openssl
WORKDIR /opt/
COPY toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z /opt/
RUN tar -xvf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/initial  && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/stamp  && \
    apt-get update && \
    apt-get install git wget perl make cmake ninja-build g++ gcc xz-utils -y  && \
    wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz --no-check-certificate &&  \
    tar -xvf /opt/openssl-1.0.2u.tar.gz && \
    rm -rf /opt/openssl-1.0.2u.tar.gz && \
    wget https://github.com/upx/upx/releases/download/v3.95/upx-3.95-amd64_linux.tar.xz    &&  \
    tar -xvf upx-3.95-amd64_linux.tar.xz && \
    rm -rf /opt/upx-3.95-amd64_linux.tar.xz && \
    git clone -b 1.65.0 --depth 1 https://github.com/rust-lang/rust.git && \
    cd rust && \
    git submodule update --recursive  --init --depth 1



