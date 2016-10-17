#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

PACKAGE_NAME="CERN-ROOT"
PACKAGE_TARNAME="root"

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

echo "INFO: Installing ${PACKAGE_NAME}-${PACKAGE_VERSION} ..." >&2

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"
MODULE_SUBDIR="${PACKAGE_TARNAME}/${PACKAGE_VERSION}"

if [ -d "${SW_DIR}/${MODULE_SUBDIR}" ] ; then
    echo "INFO: Nothing to do, ${PACKAGE_NAME}-${PACKAGE_VERSION} already installed." >&2
    exit 0
fi

curl "https://root.cern.ch/download/root_v${PACKAGE_VERSION}.Linux-centos7-x86_64-gcc4.8.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^root\($\|/\)!'"${MODULE_SUBDIR}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
source "${SW_DIR}/${MODULE_SUBDIR}/bin/thisroot.sh"
EOF
