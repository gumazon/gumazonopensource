#!/usr/bin/env sh

: "

__name__ = license_gnu3

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds GNU v3 License To The Given Package.

__input__ = (OUTPUT_DIRNAME=/path/to/pkg-root)

__output__ = <OUTPUT_DIRNAME>/LICENSE.txt
             <OUTPUT_DIRNAME>/environ/license_setup_classifier,
             <OUTPUT_DIRNAME>/environ/license_setup_title

"

OUTPUT_DIRNAME=${1}
ENVIRON_DIR="${OUTPUT_DIRNAME}/environ"
chmod +rwx ${ENVIRON_DIR}
chmod +rwx ${ENVIRON_DIR}/*

PKG_YEAR=$(cat ${ENVIRON_DIR}/YEAR)
PKG_TITLE=$(cat ${ENVIRON_DIR}/TITLE)
PKG_AUTHOR=$(cat ${ENVIRON_DIR}/AUTHOR)


echo 'GNU General Public License v3 (GPLv3)' > ${ENVIRON_DIR}/license_setup_classifier
echo 'GNU General Public License v3' > ${ENVIRON_DIR}/license_setup_title

cat << EOF > ${OUTPUT_DIRNAME}/LICENSE.txt
GNU GENERAL PUBLIC LICENSE
                      Version 3, 29 June 2007

    ${PKG_TITLE}
    Copyright (C) ${PKG_YEAR}  ${PKG_AUTHOR}

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

Also add information on how to contact you by electronic and paper mail.

  You should also get your employer (if you work as a programmer) or school,
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<http://www.gnu.org/licenses/>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<http://www.gnu.org/philosophy/why-not-lgpl.html>.
EOF
