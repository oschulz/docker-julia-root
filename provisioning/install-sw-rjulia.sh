#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

echo "Adding rjulia binary for ROOT-6 compatibility to Julia installation ..." >&2

ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"
source "${ENV_SCRIPT}"

JULIA_HOME=`julia -e "println(JULIA_HOME)"`

BUILDAREA=`mktemp -d -t "$(whoami)-build-rjulia-XXXXXX"`
echo "Build area: \"${BUILDAREA}\""

(
	cd "${BUILDAREA}" \
	&& git clone https://github.com/jpata/ROOT.jl.git --branch cxx ROOT.jl \
	&& cd "ROOT.jl/deps" \
	&& julia build.jl \
	&& cp -a "usr/bin/julia" "$JULIA_HOME/rjulia"
)

rm -rf "${BUILDAREA}"
