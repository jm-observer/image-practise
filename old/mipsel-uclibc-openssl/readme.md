

```
docker build -t tmp/tmp-toolchain:latest -f mipsel-uclibc-openssl/01-toolchain/Dockerfile .
docker build -t tmp/tmp-openssl-upx:latest -f mipsel-uclibc-openssl/02-openssl-upx/Dockerfile .
docker build -t tmp/tmp-llvm:latest -f mipsel-uclibc-openssl/03-llvm/Dockerfile .
docker build -t tmp/tmp-rust:latest -f mipsel-uclibc-openssl/04-rust/Dockerfile .
docker build -t tmp/rust-uclibc:latest -f mipsel-uclibc-openssl/Dockerfile .
```
```
docker run --rm -it -v C:\Users\36225\.git-credentials:/root/.git-credentials ^
    -v C:\Users\36225\uclibc\registry:/usr/local/cargo/registry -v C:\Users\36225\uclibc\/git:/usr/local/cargo/git   ^
    -v D:\wangju\iiotengine:/root/src       ^
    tmp/rust-uclibc:latest     ^
    sh -c "cargo build --bin iiot_engine --no-default-features --features=prod --release && rm -r
f target/iiot_engine-uclibc  && upx --best --lzma -o ./target/iiot_engine-uclibc ./target/mipsel-unknown-linux-uclibc/release/iiot_engine && scp -o 'StrictHostKeyChecking=no' ./target/ii
ot_engine-uclibc root@192.168.254.30:/tmp/iiot_engine && ssh root@192.168.254.30 '/etc/init.d/iiot_engine.sh stop && cp -f /tmp/iiot_engine /usr/local/iiot_engine && /etc/init.d/iiot_eng
ine.sh start'      "
```