#!/usr/bin/env sh

# setup_cfg.sh


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
