#!/usr/bin/env sh
# https://cli.vuejs.org/zh/guide/deployment.html#github-pages
# stop when error
set -e

# build
npm run build

# cd build dir
cd dist

# commit dist

git init
git add -A
git commit -m 'Update Github Gages'

# push to gh-pages branch
git push -f git@github.com:nusr/vuecli3.0-svg.git master:gh-pages

cd -
