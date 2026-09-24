#!/usr/bin/env bash

#
# Copyright (c) 2026 SushiUI Extended
# All rights reserved

DEVICE="rhode"
VERSION="1.2.0b1"
VENDOR="motorola"
AB="true"
RESOLUTION="1080x2400"
SOC="QTI SM6225"
ARCHITECTURES="aarch64,armeabi-v7a,armeabi"
LATEST_SDK="33"
FIRST_SDK="32"
BUILDNO="T2SRS33.72-22-4-11"
BUILD_SDK="33"
# color variables
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"
BLUE="\e[34m"
# functions (commands)
sushidevinfo() {
  echo -e "Device ${BLUE}$DEVICE${RESET} info"
  echo -e "SoC: $SOC"
  echo -e "SushiUI version: $VERSION"
  echo -e "A/B: $AB"
  echo -e "Architectures: $ARCHITECTURES"
}

smake() {
  local -a MAKEFLAGS=()
  local arg
  local has_jobs=0

  for arg in "$@"; do
    case "$arg" in
      -j|--jobs)
        has_jobs=1
        ;;
      -j[0-9]*|--jobs=[0-9]*)
        has_jobs=1
        ;;
    esac
  done

  if (( !has_jobs )); then
    MAKEFLAGS+=("-j$(nproc)")
  fi

  command make "${MAKEFLAGS[@]}" "$@"
}
