abs_dirname() {
    (echo "${1}" | grep -q '^/') && dirname "${1}" || (cd "`pwd`/`dirname \"${1}\"`" && pwd)
}

abs_path() {
    (echo "$1" | grep -q '^/') && echo "$1" || (cd "`pwd`/`dirname \"$1\"`" && echo "`pwd`/`basename \"$1\"`")
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
