#!/bin/sh
./WasmEdge-0.11.2-Linux/bin/wasmedgec nbody.out nbody.wasm
./WasmEdge-0.11.2-Linux/bin/wasmedgec nbody.out nbody.so
wasmer compile nbody.out -o nbody_wasmer_aot
wasmtime compile nbody.out

./WasmEdge-0.11.2-Linux/bin/wasmedgec fannkuchredux.out fannkuchredux.wasm
./WasmEdge-0.11.2-Linux/bin/wasmedgec fannkuchredux.out fannkuchredux.so
wasmer compile fannkuchredux.out -o fannkuchredux_wasmer_aot
wasmtime compile fannkuchredux.out

./WasmEdge-0.11.2-Linux/bin/wasmedgec fasta.out fasta.wasm
./WasmEdge-0.11.2-Linux/bin/wasmedgec fasta.out fasta.so
wasmer compile fasta.out -o fasta_wasmer_aot
wasmtime compile fasta.out

./WasmEdge-0.11.2-Linux/bin/wasmedgec simple.out simple.wasm
./WasmEdge-0.11.2-Linux/bin/wasmedgec simple.out simple.so
wasmer compile simple.out -o simple_wasmer_aot
wasmtime compile simple.out

./WasmEdge-0.11.2-Linux/bin/wasmedgec spectralnorm.out spectralnorm.wasm
./WasmEdge-0.11.2-Linux/bin/wasmedgec spectralnorm.out spectralnorm.so
wasmer compile spectralnorm.out -o spectralnorm_wasmer_aot
wasmtime compile spectralnorm.out


