#!/usr/bin/env sh

: "

__name__ = history.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds HISTORY.rst To The Given Package.

__input__ = (OUTPUT_DIRNAME=/path/to/pkg-root)

__output__ = <OUTPUT_DIRNAME>/HISTORY.rst

"

OUTPUT_DIRNAME=${1}

cat << EOF > ${OUTPUT_DIRNAME}/HISTORY.rst
=======
History
=======

0.1.0 (2022-01-09)
------------------

* First release on PyPI.
EOF
