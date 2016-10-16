#!/bin/bash

JULIA_VERSION="0.5.0"

SW_DIR="/opt"
ENV_SCRIPT="${SW_DIR}/env.sh"

MODULE_NAME="julia"
MODULE_VERSION="${JULIA_VERSION}"

HOSTSPEC="linux-x86_64"

curl "https://julialang.s3.amazonaws.com/bin/linux/x64/0.5/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^julia-..........\($\|/\)!'"${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}"'\1!'

cat >> "/opt/env.sh" <<EOF
export PATH="${SW_DIR}/${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}/bin:\$PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}/lib:\$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}/lib/julia:\$LD_LIBRARY_PATH"
EOF
