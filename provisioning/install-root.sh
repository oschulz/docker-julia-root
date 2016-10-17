#!/bin/bash -e

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"

MODULE_NAME="root"
MODULE_VERSION="${PACKAGE_VERSION}"

curl "https://root.cern.ch/download/root_v${PACKAGE_VERSION}.Linux-centos7-x86_64-gcc4.8.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^root\($\|/\)!'"${MODULE_NAME}/${MODULE_VERSION}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
source "${SW_DIR}/${MODULE_NAME}/${MODULE_VERSION}/bin/thisroot.sh"
EOF
