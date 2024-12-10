build-python:
	cargo build --release
	cargo run --bin uniffi-bindgen generate --library target/release/libtestrust.dylib --language python --out-dir sdk/python
	cp -R target/release/libtestrust.dylib sdk/python

build-go:
	cargo build --release
	uniffi-bindgen-go --library target/release/libtestrust.dylib --out-dir sdk/go
	cp -R target/release/libtestrust.dylib sdk/go