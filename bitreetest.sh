#!/bin/sh
\time -v -o tmp1 ./binarytree 20 >>null
\time -v -o tmp2 ./WasmEdge-0.11.2-Linux/bin/wasmedge ./biwasm.so 20 >>null
\time -v -o tmp3 ./WasmEdge-0.11.2-Linux/bin/wasmedge ./biwasm.wasm 20 >>null
\time -v -o tmp4 wasmer ./biwasm.out 20 >>null
\time -v -o tmp5 wasmtime ./biwasm.out 20 >>null
\time -v -o tmp6 wasmer run ./biwasmer.aot 20 >>null
\time -v -o tmp7 wasmtime run ./biwasm.cwasm --allow-precompiled 20 >>null

CPU_USAGE=$(cat tmp1 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME=$(cat tmp1 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM=$(cat tmp1 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasm_so=$(cat tmp2 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasm_so=$(cat tmp2 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasm_so=$(cat tmp2 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasm=$(cat tmp3 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasm=$(cat tmp3 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasm=$(cat tmp3 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasmer=$(cat tmp4 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasmer=$(cat tmp4 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasmer=$(cat tmp4 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasmtime=$(cat tmp5 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasmtime=$(cat tmp5 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasmtime=$(cat tmp5 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasmer_aot=$(cat tmp6 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasmer_aot=$(cat tmp6 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasmer_aot=$(cat tmp6 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasmtime_aot=$(cat tmp7 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasmtime_aot=$(cat tmp7 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasmtime_aot=$(cat tmp7 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')
echo "type     memory   time   cpu_uasge"
echo "native   ${MAXIMUN_MEM}MB ${ELAPSED_TIME} ${CPU_USAGE}"
echo "wasmedge    ${MAXIMUN_MEM_wasm}MB ${ELAPSED_TIME_wasm} ${CPU_USAGE_wasm}"
echo "wasmedge_so  ${MAXIMUN_MEM_wasm_so}MB ${ELAPSED_TIME_wasm_so} ${CPU_USAGE_wasm_so}"
echo "wasmer  ${MAXIMUN_MEM_wasmer}MB ${ELAPSED_TIME_wasmer} ${CPU_USAGE_wasmer}"
echo "wasmer_aot  ${MAXIMUN_MEM_wasmer_aot}MB ${ELAPSED_TIME_wasmer_aot} ${CPU_USAGE_wasmer_aot}"
echo "wasmtime  ${MAXIMUN_MEM_wasmtime}MB ${ELAPSED_TIME_wasmtime} ${CPU_USAGE_wasmtime}"
echo "wasmtime_aot  ${MAXIMUN_MEM_wasmtime_aot}MB ${ELAPSED_TIME_wasmtime_aot} ${CPU_USAGE_wasmtime_aot}"

