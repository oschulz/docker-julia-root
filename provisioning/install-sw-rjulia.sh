#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

echo "INFO: Adding rjulia binary for ROOT-6 compatibility to Julia installation ..." >&2

source "${ENV_SCRIPT}"

JULIA_HOME=`julia -e "println(JULIA_HOME)"`

if [ -f "${JULIA_HOME}/rjulia" ] ; then
    echo "INFO: Nothing to do, rjulia already installed." >&2
    exit 0
fi

BUILDAREA=`mktemp -d -t "$(whoami)-build-rjulia-XXXXXX"`
echo "Build area: \"${BUILDAREA}\""

(
	cd "${BUILDAREA}" \
	&& git clone https://github.com/jpata/ROOT.jl.git --branch cxx ROOT.jl \
	&& cd "ROOT.jl/deps" \
	&& julia build.jl \
	&& cp -a "usr/bin/julia" "${JULIA_HOME}/rjulia"
)

rm -rf "${BUILDAREA}"
