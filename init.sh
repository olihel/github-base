#!/bin/sh

#
# https://github.com/olihel/github-base.git
#
# Copyright (c) 2013 Oliver Hellebusch
# Released under MIT license (https://raw.github.com/olihel/github-base/master/LICENSE)
#

if [ ! -d ".git" ]; then
  echo
  echo "No git repo or not in the root of a repo!"
  echo
  exit 1
fi

git rev-parse HEAD &> /dev/null
exitCode=$?
if [ $exitCode == 0 ]; then
  echo
  echo "git repo already initialized!"
  echo
  exit 1
fi

if [ -z "$1" ] || [ -z "$2" ]; then
  echo
  echo "Please provide a project title and name for repo initialization:"
  echo "$0 \"Project Name\" \"project-name\""
  echo
  exit 1
fi


projectTitle="$1"
projectName="$2"
projectYear="`date +%Y`"
echo
echo "######"
echo "### Initializing ${projectTitle} / ${projectName} / ${projectYear}"...
echo

echo "### Updating strings..."
echo
find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{title}}/${projectTitle}/g"
find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{name}}/${projectName}/g"
find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{year}}/${projectYear}/g"
echo

echo "### Initializing master branch..."
echo
git add .
git rm --cached init.sh
git commit -m "initial commit"
git push origin master
echo

echo "### Initializing gh-pages branch..."
echo
git checkout --orphan gh-pages
git rm -rf .
git read-tree master:src
git commit -m "initial commit"
git push origin gh-pages
git checkout master
echo

echo "### Initialization complete, you can now delete this script ($0)"
echo
exit 0
