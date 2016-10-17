#!/bin/bash -e

abs_dirname() {
    cd "$(dirname "$1")"
    pwd
}

abs_path() {
	echo "$(abs_dirname "$1")/$(basename "$1")" | sed 's|^//|/|'
}


PROVISION_DIR=`abs_dirname "${0}"`
echo "PROVISION_DIR=${PROVISION_DIR}" >&2

SW_DIR="${SW_DIR:-/opt}"
export SW_DIR=`abs_path "${SW_DIR}"`
echo "SW_DIR=${SW_DIR}" >&2
mkdir -p "${SW_DIR}"

ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"
export ENV_SCRIPT=`abs_path "${ENV_SCRIPT}"`
echo "ENV_SCRIPT=${ENV_SCRIPT}" >&2
