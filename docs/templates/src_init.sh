#!/usr/bin/env sh

: "

:__name__: src_init.sh

:__version__: 0.1.0

:__author__: Gumshoe Media Inc.

:__title__: $(basename ${0}) Adds (init) To The Given Package Source.

:__input__: (ROOT_DIRNAME=/path/to/pkg-root)

:__output__: <ROOT_DIRNAME>/<PKG_NAME>/__init__.py

"

ROOT_DIRNAME=${1}
PKG_NAME=$(basename ${ROOT_DIRNAME})
PKG_VERSION="$(cat ${ROOT_DIRNAME}/environ/VERSION)"

cat << EOF > "${ROOT_DIRNAME}/${PKG_NAME}/__init__.py"
__version__ = '${PKG_VERSION}'

EOF
