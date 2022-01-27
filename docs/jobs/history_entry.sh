#!/usr/bin/env sh

: "

__name__ = history_entry.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds a new entry to HISTORY.rst in The Given Package.

__input__ = (OUTPUT_DIRNAME=/path/to/pkg-root)

__output__ = <OUTPUT_DIRNAME>/HISTORY.rst with the new entry

"


OUTPUT_DIRNAME=${1}

cat << EOF >> ${OUTPUT_DIRNAME}/HISTORY.rst

$(echo ${OUTPUT_DIRNAME}/$(basename ${OUTPUT_DIRNAME})/environ/VERSION) ($(date+%Y-%m-%d))
------------------

* $(git log -1)
EOF
