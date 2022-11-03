FROM messense/rust-musl-cross:mipsel-musl

ARG OPENSSL_ARCH=linux-mips32

COPY resource/upx /usr/bin/

RUN export CC=$TARGET_CC && \
    export C_INCLUDE_PATH=$TARGET_C_INCLUDE_PATH && \
    export LD=$TARGET-ld && \
    echo "Building OpenSSL" && \
    VERS=1.1.1s && \
    CHECKSUM=c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa && \
    curl -sqO https://www.openssl.org/source/openssl-$VERS.tar.gz && \
    echo "$CHECKSUM openssl-$VERS.tar.gz" > checksums.txt && \
    sha256sum -c checksums.txt && \
    tar xzf openssl-$VERS.tar.gz && cd openssl-$VERS && \
    ./Configure $OPENSSL_ARCH -fPIC --prefix=$TARGET_HOME && \
    make -j$(nproc) && make install && \
    cd .. && rm -rf openssl-$VERS.tar.gz openssl-$VERS checksums.txt

ENV OPENSSL_DIR=$TARGET_HOME/ \
    OPENSSL_INCLUDE_DIR=$TARGET_HOME/include/ \
    DEP_OPENSSL_INCLUDE=$TARGET_HOME/include/ \
    OPENSSL_LIB_DIR=$TARGET_HOME/lib/


