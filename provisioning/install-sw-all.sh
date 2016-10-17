#!/bin/bash -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}"/install-sw-root.sh 6.06.06
"${SCRIPT_DIR}"/install-sw-julia.sh 0.5.0
"${SCRIPT_DIR}"/install-sw-cmake.sh 3.6.2

"${SCRIPT_DIR}"/install-sw-julia-cxx.sh
"${SCRIPT_DIR}"/install-sw-rjulia.sh

echo "INFO: Software installation complete." >&2
