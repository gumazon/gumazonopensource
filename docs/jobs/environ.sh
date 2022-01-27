#!/usr/bin/env sh

: "

__name__ = setup_py.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds (environ) To The Given Package.

__input__ = (PKG_TITLE, PKG_VERSION, PKG_AUTHOR, PKG_AUTHOR_EMAIL, PKG_USERNAME, PKG_URL, PKG_YEAR, PY_VERSIONS, OUTPUT_DIRNAME=/path/to/pkg-root)


__output__ = <OUTPUT_DIRNAME>/setup.py

__requires__ = ['.environ', README.rst, HISTORY.rst, LICENSE.txt]

"
PKG_TITLE=${1}
PKG_VERSION=${2}
PKG_AUTHOR=${3}
PKG_AUTHOR_EMAIL=${4}
PKG_USERNAME=${5}
PKG_URL=${6}
PKG_YEAR=${7}
PY_VERSIONS=${8}
OUTPUT_DIRNAME=${9}

# EXAMPLE:
#  ./makefiles/environ.sh "$(PKG_TITLE)" "$(PKG_VERSION)" "$(PKG_AUTHOR)" "$(PKG_AUTHOR_EMAIL)" \
#    "$(PKG_URL)" "$(PKG_YEAR)" "$(PKG_USERNAME)" "$(PY_VERSIONS)" "$(OUTPUT_DIRNAME)"
# ---- .environ files: [TITLE, VERSION, AUTHOR, AUTHOR_EMAIL, USERNAME, URL, YEAR, PY_VERSIONS]

echo "${PKG_TITLE}" > ${OUTPUT_DIRNAME}/TITLE
echo "${PKG_VERSION}" > ${OUTPUT_DIRNAME}/VERSION
echo "${PKG_AUTHOR}" > ${OUTPUT_DIRNAME}/AUTHOR
echo "${PKG_AUTHOR_EMAIL}" > ${OUTPUT_DIRNAME}/AUTHOR_EMAIL
echo "${PKG_USERNAME}" > ${OUTPUT_DIRNAME}/USERNAME
echo "${PKG_URL}" > ${OUTPUT_DIRNAME}/URL
echo "${PKG_YEAR}" > ${OUTPUT_DIRNAME}/YEAR
echo "${PY_VERSIONS}" > ${OUTPUT_DIRNAME}/PY_VERSIONS
