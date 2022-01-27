#!/usr/bin/env sh

: "

__name__ = setup_cfg.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds (setup.cfg) To The Given Package.

__input__ = (ROOT_DIRNAME=/path/to/pkg-root)

__output__ = <ROOT_DIRNAME>/setup.cfg

__requires__ = ['.environ', README.rst, HISTORY.rst, LICENSE.txt]

"

ROOT_DIRNAME=${1}

ENVIRON_DIR="${ROOT_DIRNAME}/environ"
PKG_NAME=$(basename ${ROOT_DIRNAME})
PKG_VERSION=$(cat ${ENVIRON_DIR}/VERSION)


cat << EOF > "${ROOT_DIRNAME}/setup.cfg"
[bumpversion]
current_version = ${PKG_VERSION}
commit = True
tag = True

[bumpversion:file:setup.py]
search = version='{current_version}'
replace = version='{new_version}'

[bumpversion:file:${PKG_NAME}/__init__.py]
search = __version__ = '{current_version}'
replace = __version__ = '{new_version}'

[bdist_wheel]
universal = 1

[flake8]
exclude = docs

[tool:pytest]
collect_ignore = ['setup.py']
EOF
