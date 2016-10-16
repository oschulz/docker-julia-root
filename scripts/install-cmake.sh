#!/bin/bash

CMAKE_VERSION_MAJOR="3.6"
CMAKE_VERSION_MINOR="2"
CMAKE_VERSION="${CMAKE_VERSION_MAJOR}.${CMAKE_VERSION_MINOR}"

SW_DIR="/opt"
ENV_SCRIPT="${SW_DIR}/env.sh"

MODULE_NAME="cmake"
MODULE_VERSION="${CMAKE_VERSION}"

HOSTSPEC="linux-x86_64"

curl "https://cmake.org/files/v${CMAKE_VERSION_MAJOR}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^cmake-'"${CMAKE_VERSION}"'-Linux-x86_64\($\|/\)!'"${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}"'\1!'

cat >> "/opt/env.sh" <<EOF
export PATH="${SW_DIR}/${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}/bin:\$PATH"
EOF
