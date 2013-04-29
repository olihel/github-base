#!/bin/sh

#
# https://github.com/olihel/github-base.git
#
# Copyright (c) 2013 Oliver Hellebusch
# Released under MIT license
#

if [ "$1" ] && [ "$2" ];
then
  projectTitle="$1"
  projectName="$2"
  projectYear="`date +%Y`"
  echo
  echo Initializing ${projectTitle} / ${projectName} / ${projectYear}
  echo
  echo "Updating strings..."
  find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{title}}/${projectTitle}/g"
  find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{name}}/${projectName}/g"
  find . -type f \( -name "*.html" -or -name "*.css" -or -name "*.js" -or -name "*.json" -or -name "*.md" -or -name "LICENSE" \) -print0 | xargs -0 sed -i '' -e "s/{{year}}/${projectYear}/g"
  echo
  echo "Initialization complete, you can now delete this script ($0)"
  echo
  exit 0
else
  echo
  echo "Please provide a project title and name for initialization:"
  echo "$0 \"Project Name\" \"project-name\""
  echo
  exit 1
fi
