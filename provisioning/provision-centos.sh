#!/bin/bash -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}"/system-setup-centos.sh
"${SCRIPT_DIR}"/install-sw.sh
