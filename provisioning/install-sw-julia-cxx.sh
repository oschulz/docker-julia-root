#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

echo "INFO: Installing Julia Cxx.jl ..." >&2

source "${ENV_SCRIPT}"

julia -e 'isfile(joinpath(Pkg.dir(), "METADATA")) || Pkg.init()'

# julia -e 'Pkg.clone("https://github.com/jpata/Cxx.jl.git"); Pkg.checkout("Cxx", "rtti"); Pkg.build("Cxx")'
julia -e 'Pkg.clone("https://github.com/oschulz/Cxx.jl.git"); Pkg.checkout("Cxx", "julia0.5-root"); Pkg.build("Cxx")'

CXX_PKG_DIR=`julia -e 'println(Pkg.dir("Cxx"))'`
test -d "${CXX_PKG_DIR}"
(cd "${CXX_PKG_DIR}/deps" && mkdir tmp && mv build src tmp)
(
    cd "${CXX_PKG_DIR}/deps/tmp" \
    && tar -c -f - */*/include */*/*/*/*/include build/clang_constants.jl
) | (
    cd "${CXX_PKG_DIR}/deps" \
    && tar -x -f - 
)
rm -rf "${CXX_PKG_DIR}/deps/tmp"


julia -e 'Pkg.test("Cxx")'
