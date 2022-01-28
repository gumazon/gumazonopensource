# gumazonopensource


Road map from dev to distribution


- [ x ] [Genesis](https://github.com/gumazon/gumazonopensource/blob/main/README.md#genesis)
  
- [ x ] [repo](https://github.com/gumazon/gumazonopensource/blob/main/README.md#repo)

- [ x ] [venv](https://github.com/gumazon/gumazonopensource/blob/main/README.md#venv)
  
- [ x ] [documenting](https://github.com/gumazon/gumazonopensource/blob/main/README.md#documenting)
  
- [ x ] [testing](https://github.com/gumazon/gumazonopensource/blob/main/README.md#testing)

- [ x ] [Versioning](https://github.com/gumazon/gumazonopensource/blob/main/README.md#versioning)

- [ x ] [Refs](https://github.com/gumazon/gumazonopensource/blob/main/README.md#refs)
  



## Genesis

__pkg__


## Repo

clone:
```shell
#!/usr/bin/env sh

git clone https://github.com/gumazon/gumazonopensource.git

```

Push local git repo to Remote
```shell

# Push local git repo to Remote
git branch -M main
git push -u origin main
```

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

git log > "docs/timeline.rst"

git log -1
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

__db versioning__: `alembic`
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


__package versioning__: pumb-version


## REFS
[Spring Python](https://docs.spring.io/spring-python/1.2.x/sphinx/html/security.html)

[About flush](https://www.educba.com/postgresql-flush-privileges/)

