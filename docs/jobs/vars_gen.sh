#!/usr/bin/env sh

# REPO =========================
BASEDIR="${HOME}/Public/gumazon"
CWDIR=${BASEDIR}/${PKG_NAME}
SRCDIR=${BASEDIR}/${PKG_NAME}/${PKG_NAME}
VERSION=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __version__`
AUTHOR=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __author__`
AUTHOR_EMAIL=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __email__`   # 'gumshoe.media.inc@gmail.com'

PKG_NAME=`basename ${BASEDIR}`
PKG_URL="`git config --get remote.origin.url | sed 's+git@github.com:+https://github.com/+g'`"

cat << EOF > ${CWDIR}/.env.yaml
BASEDIR: ${BASEDIR}

PKG_NAME: ${PKG_NAME}
CWDIR: ${BASEDIR}/${PKG_NAME}
SRCDIR: ${BASEDIR}/${PKG_NAME}/${PKG_NAME}

REPO_KEY: 'origin'
REPO_NAME: ${PKG_NAME}
REPO_USER: `git config user.name`
REPO_EMAIL: `git config user.email`

VERSION: ${VERSION}

AUTHOR: `git config --global user.name`
AUTHOR_EMAIL: 'gumshoe.media.inc@gmail.com'
PKG_URL: ${PKG_URL}

EOF
