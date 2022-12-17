FROM rust:1.65.0-slim-bullseye
# openssl
WORKDIR /opt/
COPY toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z /opt/
RUN tar -xvf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x.tar.z && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/initial  && \
    rm -rf /opt/toolchain-mipsel_1004kc_gcc-8.5.0_uClibc-1.0.x/stamp