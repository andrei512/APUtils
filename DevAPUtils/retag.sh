#! /bin/bash

# commit all changes
git add . --all
git ci -am "$2"
# remove old tag
git tag -d $1
# create new one
git tag $1 -m "$1"
# push changes 
git push 
# push tags
git push --tags 
