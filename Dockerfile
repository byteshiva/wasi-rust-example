FROM rust:1.60

WORKDIR /usr/src/myapp
COPY . .

RUN cargo install --path .

CMD ["siva-wasi-rust"]

