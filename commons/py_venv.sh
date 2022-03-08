#!/usr/bin/env sh

pyenv local 3.9.1
python -m venv ./.venv
. .venv/bin/activate
python -m pip install --upgrade pip
pip install poetry
poetry init
deactivate
poetry shell

echo '.venv' >> .gitignore
