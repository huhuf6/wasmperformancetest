#!/bin/sh
./WasmEdge-0.11.2-Linux/bin/wasmedgec biwasm.out biwasm.wasm
wasmedgec biwasm.out biwasm.so
wasmer compile biwasm.out -o biwasm_wasmer_aot
wasmtime compile biwasm.out
