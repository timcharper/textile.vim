#!/bin/bash

cd `dirname "$0"`
VERSION=`git tag | sort_rev | tail -n 1`
rm -rf textile
git archive --prefix=textile/ $VERSION | tar xf -
cd textile
rm .gitignore
rm package.sh

