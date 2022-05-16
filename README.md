# Build rust project

```
docker build -t my-rust-app .
```

# Run rust project

```
docker run   -it --rm my-rust-app  /bin/bash  
```

# Run wasi 
```
wasmtime --dir . target/wasm32-wasi/release/wasi-rust-example.wasm sample-world!
```
