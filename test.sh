#!/bin/sh
\time -v -o tmp1 ./binarytree 16 >>null
\time -v -o tmp2 wasmedge ./biwasm.so 16 >>null
\time -v -o tmp3 wasmedge ./biwasm.wasm 16 >>null
\time -v -o tmp4 wasmedge ./biwasm.out 12 >>null

CPU_USAGE=$(cat tmp1 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME=$(cat tmp1 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM=$(cat tmp1 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasm_so=$(cat tmp2 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasm_so=$(cat tmp2 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasm_so=$(cat tmp2 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasm=$(cat tmp3 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasm=$(cat tmp3 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasm=$(cat tmp3 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')

CPU_USAGE_wasm_no_aot=$(cat tmp4 | grep -w CPU | awk '{print  $7}')
ELAPSED_TIME_wasm_no_aot=$(cat tmp4 | grep -w Elapsed | awk '{print  $8}')
MAXIMUN_MEM_wasm_no_aot=$(cat tmp4 | grep -w Maximum | awk '{printf "%.2f", $6/1024}')
echo "type     memory   time   cpu_uasge"
echo "native   ${MAXIMUN_MEM}MB ${ELAPSED_TIME} ${CPU_USAGE}"
echo "wasm     ${MAXIMUN_MEM_wasm}MB ${ELAPSED_TIME_wasm} ${CPU_USAGE_wasm}"
echo "wasm_so  ${MAXIMUN_MEM_wasm_so}MB ${ELAPSED_TIME_wasm_so} ${CPU_USAGE_wasm_so}"
echo "wasm_no_aot  ${MAXIMUN_MEM_wasm_no_aot}MB ${ELAPSED_TIME_wasm_no_aot} ${CPU_USAGE_wasm_no_aot}"
