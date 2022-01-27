#!/usr/bin/env sh

: "

__name__ = readme.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds README.rst To The Given Package.

__input__ = (PKG_TITLE, ROOT_DIRNAME=/path/to/pkg-root)

__output__ = <ROOT_DIRNAME>/README.rst

"

ROOT_DIRNAME=${1}
PKG_NAME=$(basename ${ROOT_DIRNAME})

ENVIRON_DIR="${ROOT_DIRNAME}/environ"
PKG_TITLE=$(cat ${ENVIRON_DIR}/TITLE)
PKG_URL=$(cat ${ENVIRON_DIR}/URL)
PKG_VERSION=$(cat ${ENVIRON_DIR}/VERSION)
PKG_AUTHOR=$(cat ${ENVIRON_DIR}/AUTHOR)
PKG_AUTHOR_EMAIL=$(cat ${ENVIRON_DIR}/AUTHOR_EMAIL)

cat << EOF >> ${ROOT_DIRNAME}/README.rst
=====
${PKG_NAME}
=====
${PKG_TITLE}

${PKG_URL}

$(cat ${ROOT_DIRNAME}/HISTORY.rst)

EOF
