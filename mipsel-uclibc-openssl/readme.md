docker build -t tmp/tmp-toolchain:latest -f mipsel-uclibc-openssl/tmp-toolchain/Dockerfile .


docker build -t tmp/tmp-openssl-upx:latest -f mipsel-uclibc-openssl/tmp-openssl-upx/Dockerfile .


docker build -t tmp/tmp-llvm:latest -f mipsel-uclibc-openssl/tmp-llvm/Dockerfile .

docker build -t tmp/tmp-rust:latest -f mipsel-uclibc-openssl/tmp-rust/Dockerfile .



docker build -t tmp/rust-uclibc:latest -f mipsel-uclibc-openssl/Dockerfile .
