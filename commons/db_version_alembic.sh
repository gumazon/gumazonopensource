#!/usr/bin/env sh

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
