docker build -t tmp/tmp-toolchain:latest -f mipsel-uclibc-openssl/01-toolchain/Dockerfile .


docker build -t tmp/tmp-openssl-upx:latest -f mipsel-uclibc-openssl/02-openssl-upx/Dockerfile .


docker build -t tmp/tmp-llvm:latest -f mipsel-uclibc-openssl/03-llvm/Dockerfile .

docker build -t tmp/tmp-rust:latest -f mipsel-uclibc-openssl/04-rust/Dockerfile .



docker build -t tmp/rust-uclibc:latest -f mipsel-uclibc-openssl/Dockerfile .



docker build -t tmp/13-rust:latest -f mipsel-uclibc-openssl/13-rust/Dockerfile .
