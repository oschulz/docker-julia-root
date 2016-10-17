#!/bin/bash -e

echo XXX "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"
source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

echo "Installing CERN ROOT v${PACKAGE_VERSION}..." >&2

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"

MODULE_SUBDIR="root/${PACKAGE_VERSION}"

curl "https://root.cern.ch/download/root_v${PACKAGE_VERSION}.Linux-centos7-x86_64-gcc4.8.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^root\($\|/\)!'"${MODULE_SUBDIR}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
source "${SW_DIR}/${MODULE_SUBDIR}/bin/thisroot.sh"
EOF
