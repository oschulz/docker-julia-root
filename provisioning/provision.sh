#!/bin/bash -e

PROVISION_DIR=$((echo "${0}" | grep -q '^/') && dirname "${0}" || (cd "`pwd`/`dirname \"${0}\"`" && pwd))
echo "Provisioning directory: \"${PROVISION_DIR}\""

SW_DIR="${SW_DIR:-/opt}"
mkdir -p "${SW_DIR}"
SW_DIR=$((echo "${SW_DIR}" | grep -q '^/') && echo "${SW_DIR}" || (cd "`pwd`/${SW_DIR}" && pwd))


cd "${PROVISION_DIR}"

# ./install-root.sh 6.06.06
# ./install-julia.sh 0.5.0
# ./install-cmake.sh 3.6.2
# ./install-julia-cxx.sh
# ./install-julia-root.sh
