#!/bin/bash -e

ENV_SCRIPT="env.sh"
source "${ENV_SCRIPT}"

JULIA_HOME=`julia -e "println(JULIA_HOME)"`
git clone https://github.com/jpata/ROOT.jl.git --branch cxx
(cd "ROOT.jl/deps" && julia build.jl)
cp -a "ROOT.jl/deps/usr/bin/julia" "$JULIA_HOME/rjulia"
