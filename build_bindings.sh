#!/bin/bash
set -euxo pipefail

SCRIPT_DIR="${SCRIPT_DIR:-$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )}"
ROOT_DIR="$SCRIPT_DIR"

BINDINGS_DIR="$ROOT_DIR/binding_tests/generated"
BINARIES_DIR="$ROOT_DIR/target/release"

rm -rf $BINDINGS_DIR
mkdir $BINDINGS_DIR

# FIXME: It would be better to generate and build fixtures one by one, instead of combining
# them all into the same library

if [[ "$OSTYPE" == "darwin"* ]]; then
LIB_FILE="$BINARIES_DIR/libtestrust.dylib"
else
LIB_FILE="$BINARIES_DIR/libtestrust.so"
fi
uniffi-bindgen-go $LIB_FILE --out-dir "$BINDINGS_DIR" --library --config "uniffi.toml"