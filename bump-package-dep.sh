#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Please specify an Atom package directory"
  exit 1
fi

if [[ `git status --porcelain -- package.json` ]]; then
  echo "package.json has uncommitted changes; aborting"
  exit 1
fi


name=`jq -r .name "$1"/package.json`
version=`jq -r .version "$1"/package.json`

set -e

jq ".packageDependencies[\"$name\"] = \"$version\"" package.json > package.json.bump
mv package.json.bump package.json
git commit -m ":arrow_up: $name@$version" -- package.json
git show head

echo
echo ">> Updated $name to $version! Don't forget to push"
