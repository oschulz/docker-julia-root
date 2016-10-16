#!/bin/bash

ROOT_VERSION="6.06.06"

SW_DIR="/opt"
ENV_SCRIPT="${SW_DIR}/env.sh"

MODULE_NAME="root"
MODULE_VERSION="${ROOT_VERSION}"

HOSTSPEC="linux-centos-7-x86_64"

curl "https://root.cern.ch/download/root_v${ROOT_VERSION}.Linux-centos7-x86_64-gcc4.8.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^root\($\|/\)!'"${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
source "${SW_DIR}/${MODULE_NAME}/${HOSTSPEC}/${MODULE_VERSION}/bin/thisroot.sh"
EOF
