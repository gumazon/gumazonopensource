# gumazonopensource

Road map from dev to distribution


- __DEV__
  - [ x ] [Genesis](https://github.com/gumazon/gumazonopensource/blob/main/README.md#genesis)
  
  - [ x ] [repo](https://github.com/gumazon/gumazonopensource/blob/main/README.md#repo)

  - [ x ] [venv](https://github.com/gumazon/gumazonopensource/blob/main/README.md#venv)
  
  - [ x ] [documenting](https://github.com/gumazon/gumazonopensource/blob/main/README.md#documenting)
  
  - [ x ] [testing](https://github.com/gumazon/gumazonopensource/blob/main/README.md#testing)

  - [ x ] [Versioning](https://github.com/gumazon/gumazonopensource/blob/main/README.md#versioning)

  - [ x ] [Security](https://github.com/gumazon/gumazonopensource/blob/main/README.md#security)

- __BUILD__

- __DISTRIBUTE__

- __OUTPUT__:

myapp/

|**____ myapp/**

|____ ____ `LICENSE.txt`

|____ ____ `README.rst`

|____ ____ `setup.py`

|**____ ____ tests/**


|**____ ____ myapp/**

|____ ____ ____ `__init__.py`

|____ ____ ____ `__main__.py`

|____ ____ ____ `model.py`

|____ ____ ____ `view.py`

|____ ____ ____ `controller.py`

|____ ____ ____ api/

|____ ____ ____ ____ `model.py`
- data CRUD `Model`

|____ ____ ____ ____ `view.py`
- JSON

|____ ____ ____ ____ `controller.py`
1. index
2. search
3. show
4. save
5. update
6. delete

|____ ____ ____ ____ models/

|____ ____ ____ ____ ____ `dbadaptor.py`   
- db adaptor for  `sqlalchemy`
- db versioning `alembic`

|____ ____ ____ ____ ____ `err.py`
- app-wide exception handlers.

|____ ____ ____ ____ ____ `product.py`
- data blueprint `class`

|____ ____ ____ ____ ____ `user.py`
- data blueprint `class`



## Genesis
```shell

### src /proj/root/pkg/FILES

_pkg=${_project}

# __init__.py
# model.py
# view.py
# controller.py
# __main__.py

echo '.*' >> .gitignore
echo '__p*' >> .gitignore


## setup  /proj/root/FILES
_project=${1} 
_email=${2}  
_url=${3}

_root=${_project}
_pkg=${_project}
_author=`git config --global user.name`

_repo_name=${_pkg}
_repo_user=`git config user.name`
_repo_email=`git config user.email`

# make /proj/root/pkg directories
mkdir -p "${_project}"/"${_root}"/"${_pkg}"

# LICENSE.txt
cat<< EOF > "${_project}"/"${_root}"/LICENSE.txt

MIT License

Copyright $(date +'%Y') $(_author)


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

EOF

# README.rst
echo $(python -c "${1}"[2:] | pydoc ad) > "${_project}"/"${_root}"/README.rst


# requirements.txt
pip freeze >  "${_project}"/"${_root}"/requirements.txt


# setup.py
cat << EOF >  "${_project}"/"${_root}"/setup.py

from setuptools import setup, find_packages

with open('requirements.txt', 'r') as _infl:
  requires = [str(_req) for _req in _infl.readlines()]


setup(
    name='${_pkg}',
    version='0.1.0',
    url='https://github.com/${_pkg}.git',
    author='${_author}',
    author_email='${_email}',
    description='Provides ${_pkg} Controller of the given DB_URL data to work within the given session.',
    packages=find_packages(),    
    install_requires=[str(_req) for _req in requires],
)


EOF


```

## Repo
```shell

# New Repo ==========================
# In /project_root_dir/ run:
git init

# Repo Remote Settings: Create Remote Repo <eg: on github.com> and get settings: 
# -------------------- 
REPO_KEY='github'
REPO_LOC='github.com'
REPO_USER='gumazon'
REPO_NAME='ad'

# Set Upstream URL: <To remove repo: $ git remote rm origin>
# ---------------- <https://${REPO_LOC}/${REPO_USER}/${REPO_NAME}.git || 
#                   git@${REPO_LOC}:${REPO_USER}/${REPO_NAME}.git>
git remote add ${REPO_KEY} git@${REPO_LOC}:${REPO_USER}/${REPO_NAME}.git

# Add gitignore lines
echo '.*' >> .gitignore

# init remote: Push to Remote ==================================
# Push local git repo to Remote
git branch -M main
git push -u origin main


### git push

# Push to Remote ==================================
# Push local git repo to Remote
git branch -M main
git push -u origin main
```

## Venv
```shell

# In /project_root_dir/ run:
pyenv local 3.9.1
python -m venv ./.venv
. .venv/bin/activate
python -m pip install --upgrade pip
echo '.venv' >> .gitignore

```

## Documenting
```python

import pydoc

```

## Testing
```shell

pytest

```

## Versioning

```shell

pumb-version

```

## Security

[Spring Python](https://docs.spring.io/spring-python/1.2.x/sphinx/html/security.html)
