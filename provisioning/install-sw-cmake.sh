#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

echo "Installing CMake v${PACKAGE_VERSION} ..." >&2

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"

MODULE_SUBDIR="cmake/${PACKAGE_VERSION}"

PACKAGE_VERSION_MAJOR=`echo "${PACKAGE_VERSION}" | cut -d '.' -f '1,2'`
curl "https://cmake.org/files/v${PACKAGE_VERSION_MAJOR}/cmake-${PACKAGE_VERSION}-Linux-x86_64.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^cmake-'"${PACKAGE_VERSION}"'-Linux-x86_64\($\|/\)!'"${MODULE_SUBDIR}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
export PATH="${SW_DIR}/${MODULE_SUBDIR}/bin:\$PATH"
EOF
