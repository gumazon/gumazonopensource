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

|____ ____ `HISTORY.rst`

|____ ____ `README.rst`

|____ ____ `setup.py`

|**____ ____ docs/**

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
_project=${1}     # 'ad'
_email=${2}   # 'gumshoe.media.inc@gmail.com'
_url=${3}

_root=${_project}
_pkg=${_project}
_author=`git config --global user.name`

_repo_name=${_pkg}
_repo_user=`git config user.name`
_repo_email=`git config user.email`

_version='0.1.0'
_git_tag_msg='First release on PyPI.'


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



# HISTORY.rst
#
# ____ CREATE : New History File:
cat << EOF > "${_project}"/"${_root}"/HISTORY.rst
=======
History
=======

EOF
#
#
# _____UPDATE: Append New Entry To History File:
cat << EOF >>  "${_project}"/"${_root}"/HISTORY.rst

${_version} (`date +'%Y-%m-%d'`)
--------------------------------
- ${_git_tag_msg}


EOF


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

### Setup

clone:
```shell
#!/usr/bin/env sh

git clone https://github.com/gumazon/gumazonopensource.git

```

gitignore file:
```shell
#!/usr/bin/env sh

# .gitignore
cat<<EOF >> .gitignore

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/


EOF

```

Push local git repo to Remote
```shell

# Push local git repo to Remote
git branch -M main
git push -u origin main
```


Set Upstream URL
```shell
#!/usr/bin/env sh

# Repo Remote Settings: Create Remote Repo <eg: on github.com> and get settings: 
# --------------------  <git@github.com:gumazon/ad.git || https://github.com/gumazon/ad.git>
REPO_KEY='github'
REPO_LOC='github.com'
REPO_USER='gumazon'
REPO_NAME='ad'

# Set Upstream URL: <To remove repo: $ git remote rm origin>
# ---------------- <https://${REPO_LOC}/${REPO_USER}/${REPO_NAME}.git || 
#                   git@${REPO_LOC}:${REPO_USER}/${REPO_NAME}.git>
git remote add ${REPO_KEY} git@${REPO_LOC}:${REPO_USER}/${REPO_NAME}.git

```


### Create

create branch
```shell
# create branch
_branch_name='genesis'
git branch ${_branch_name}

# change into branch
git add .
git commit -m 'Consolidate changes before changing branch'
git checkout ${_branch_name}

```

### Read:

__branch__
```shell

# index
git branch

# show
git branch 

```

__log__
```shell
#!/usr/bin/env sh

git log > "docs/log$(date +'%Y%m%d%H%M').rst"

```


## Venv

__setup__
```shell
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

### Unit Testing

Using: `pytest`

```shell

pip install -U pytest
pytest --version
pytest init

```

## Versioning

### db versioning 

Using: `alembic`

```shell
# In /project_root_dir:
alembic init .alembic
echo 'alembic.ini' >> .gitignore
echo 'db' >> .gitignore

# In /project_root_dir/alembic.ini, change:
sqlalchemy.url = sqlite:///sqlitedb.sqlite

# upgrade from declarative_base: In /project_root_dir/db/env.py, change:
echo << EOF

# In ".alembic/env.py"
# --------------------
model = runpy.run_path('../../user/user/user/model.py')
target_metadata = model['Base'].metadata

EOF

# autogenerate a Baseline Script:  or $( alembic revision -m "$(basename `pwd`)s" )
alembic revision --autogenerate -m "add $(basename `pwd`)s table"

# generate tables: upgrade db to the new head
alembic upgrade head


# upgrade from sql: In shell terminal, run:
# $ alembic upgrade --sql ${start_rev}:${end_rev}

```


### package versioning
```shell

pumb-version

```


## Security

[Spring Python](https://docs.spring.io/spring-python/1.2.x/sphinx/html/security.html)



## API

-  Index:

   url: `GET` `/api/<resource>`
   
   handler: `controller.index`
   
   response: `[]`


-  Show:

   url: `GET` `/api/<resource>/{id}`
   
   handler: `controller.show`
   
   response: `{}`


-  Save:

   url: `POST` `/api/<resource>`  `query_str_from(**kwargs)`
   
   handler: `controller.save`
   
   response: `[]`


-  Update:

   url: `PUT` `/api/<resource>/{id}`  `query_str_from(**kwargs)`
   
   handler: `controller.update`
   
   response: `{}`


-  Delete:

   url: `DELETE` `/api/<resource>/{id}`
   
   handler: `controller.delete`
   
   response: `[]`




## Workflows

- Create:
  1. Make dirs
  2. Make files
  3. Upload and sync repo


- Develop:
  1. clone repo
  2. Make changes
  

- Update:


- Test:
  1. Run tests.  
  2. Commit and push to remote Repo, if passed tests, else exit_update.


- Release
  1. Pump `PKG` and `DB` Versions
  2. Rebuild files
  3. Tag repo and push to remote


- Distribute
  * Build
  * Upload to Hosting Server



## REFS

[About flush](https://www.educba.com/postgresql-flush-privileges/)

