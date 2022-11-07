docker build -f mipsel-unknown-linux-musl/Dockerfile -t huangjiemin/musl-upx-openssl:mipsel_1.62.0_stable .


docker build -f musl-upx-openssl/mipsel-unknown-linux-musl.Dockerfile -t huangjiemin/musl-upx-openssl:mipsel_1.62.0_stable .
docker build -f musl-upx-openssl/x86_64-unknown-linux-musl.Dockerfile -t huangjiemin/musl-upx-openssl:x86_64_1.62.0_stable .