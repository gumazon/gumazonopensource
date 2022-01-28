#!/usr/bin/env sh


SRCDIR=${1}

TITLE=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __title__`
AUTHOR=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __author__`
LICENSE_SETUP_TITLE=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __license_setup_title__`
LICENSE_SETUP_CLASSIFIER=`${PWD}/file_attr.py ${SRCDIR}/__init__.py __license_setup_classifier__`


cat << EOF > `dirname ${SRCDIR}`/LICENSE.txt
GNU GENERAL PUBLIC LICENSE
                      Version 3, 29 June 2007

    ${TITLE}
    Copyright (C) `date +'%Y'`  ${AUTHOR}

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
