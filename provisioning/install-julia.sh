#!/bin/bash -e

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"

MODULE_NAME="julia"
MODULE_VERSION="${PACKAGE_VERSION}"

curl "https://julialang.s3.amazonaws.com/bin/linux/x64/0.5/julia-${PACKAGE_VERSION}-linux-x86_64.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^julia-..........\($\|/\)!'"${MODULE_NAME}/${MODULE_VERSION}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
export PATH="${SW_DIR}/${MODULE_NAME}/${MODULE_VERSION}/bin:\$PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_NAME}/${MODULE_VERSION}/lib:\$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_NAME}/${MODULE_VERSION}/lib/julia:\$LD_LIBRARY_PATH"
EOF
