#!/usr/bin/env sh

: "

__name__ = src_main.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds (main) To The Given Package Source.

__input__ = (ROOT_DIRNAME=/path/to/pkg-root)

__output__ = <ROOT_DIRNAME>/<PKG_NAME>/__main__.py

"

ROOT_DIRNAME=${1}
PKG_NAME=$(basename ${ROOT_DIRNAME})

cat << EOF > "${ROOT_DIRNAME}/${PKG_NAME}/__main__.py"
import runpy


try:
  runpy.run_path(__file__, run_name='__main__')
except SystemExit:
  pass

EOF
