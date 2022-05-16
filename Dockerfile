# FROM rust:1.60 as build
FROM rust:1.60 

WORKDIR /usr/src/myapp

COPY . .

RUN rustup target add wasm32-wasi
RUN cargo install --path .
RUN apt update && apt install curl vim git libxkbcommon0 libtinfo5 apt-utils -y
# RUN apt update && apt install curl vim git apt install nfo5 -y
RUN apt upgrade -y
RUN curl https://wasmtime.dev/install.sh -sSf | bash
RUN curl https://get.wasmer.io -sSfL | sh
RUN cargo build --target wasm32-wasi
RUN cargo build --target wasm32-wasi --release
RUN cargo install cargo-wasi
ENV WASMER_DIR="/root/.wasmer"
ENV PATH /root/.wasmer/bin/:$PATH

# [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# The final base image
# FROM debian:buster-slim

CMD ["siva-wasi-rust"]

