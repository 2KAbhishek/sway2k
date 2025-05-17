#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

get_platform() {
    case $(uname -s) in
    Linux)
        gpu=$(lspci -v | grep VGA | head -n 1 | awk '{print $5}')
        echo "$gpu"
        ;;
    Darwin) ;;                              # TODO - Darwin/Mac compatibility
    CYGWIN* | MINGW32* | MSYS* | MINGW*) ;; # TODO - windows compatibility
    esac
}

get_gpu() {
    gpu=$(get_platform)
    if [[ "$gpu" == NVIDIA ]]; then
        usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ sum += $0 } END { printf("%s%%\n", sum / NR) }')
    else
        usage='N/A'
    fi
    echo "$usage"
}

main() {
    gpu_usage=$(get_gpu)
    echo " $gpu_usage"
}

main
