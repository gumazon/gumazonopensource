#!/usr/bin/env sh

git clone https://github.com/gumazon/gumazonopensource.git

# Push local git repo to Remote
git branch -M main
git push -u origin main

# __branch__
# create branch
_branch_name='genesis'
git branch ${_branch_name}

# change into branch
git add .
git commit -m 'Consolidate changes before changing branch'
git checkout ${_branch_name}

# index
git branch

# show
git branch

# __log__
git log > "docs/timeline.rst"

git log -1
