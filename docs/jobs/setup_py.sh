#!/usr/bin/env sh

: "

__name__ = setup_py.sh

__version__ = 0.1.0

__author__ = Gumshoe Media Inc.

__title__ = $(basename ${0}) Adds (setup.py) To The Given Package.

__input__ = (ROOT_DIRNAME=/path/to/pkg-root)

__output__ = <ROOT_DIRNAME>/setup.py

__requires__ = ['.environ', README.rst, HISTORY.rst, LICENSE.txt]

"

ROOT_DIRNAME=${1}
PKG_NAME=$(basename ${ROOT_DIRNAME})

ENVIRON_DIR="${ROOT_DIRNAME}/environ"
PKG_TITLE=$(cat ${ENVIRON_DIR}/TITLE)
PKG_URL=$(cat ${ENVIRON_DIR}/URL)
PKG_VERSION=$(cat ${ENVIRON_DIR}/VERSION)
PKG_AUTHOR=$(cat ${ENVIRON_DIR}/AUTHOR)
PKG_AUTHOR_EMAIL=$(cat ${ENVIRON_DIR}/AUTHOR_EMAIL)


license_classifier=$(cat ${ENVIRON_DIR}/license_setup_classifier)
license_title=$(cat ${ENVIRON_DIR}/license_setup_title)
min_py_version='2.7'
max_py_version='3.9.1'



cat << EOF > "${ROOT_DIRNAME}/setup.py"
from setuptools import setup, find_packages

readme = []
with open('README.rst') as readme_file:
    readme.extend(readme_file.readlines())

history = []
with open('HISTORY.rst') as history_file:
    history.extend(history_file.readlines())

requirements = []
with open('requirements.txt') as requirements_file:
    requirements.extend(requirements_file.readlines())

dev_requirements = ['pytest>=3']
with open('requirements_dev.txt') as requirements_dev_file:
    dev_requirements.extend(requirements_dev_file.readlines())

test_requirements = []
with open('requirements_test.txt') as requirements_test_file:
    test_requirements.extend(requirements_test_file.readlines())



setup(
    name='${PKG_NAME}',
    keywords='${PKG_TITLE}',
    url='${PKG_URL}',
    version='${PKG_VERSION}',
    author='${PKG_AUTHOR}',
    author_email='${PKG_AUTHOR_EMAIL}',
    python_requires='=<${max_py_version}',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: ${license_classifier}',
        'Natural Language :: English',
        'Programming Language :: Python :: >=${min_py_version}',
        'Programming Language :: Python :: =<${max_py_version}',
    ],
    description="${PKG_TITLE}",
    entry_points={
        'console_scripts': [
            '${PKG_NAME}=${PKG_NAME}.__main__',
        ],
    },
    install_requires=requirements,
    license='${license_title}',
    long_description=readme + '\n\n' + history,
    include_package_data=True,
    packages=find_packages(include=['${PKG_NAME}', '${PKG_NAME}.*']),
    test_suite='tests',
    tests_require=test_requirements,
    zip_safe=False,
)

EOF
