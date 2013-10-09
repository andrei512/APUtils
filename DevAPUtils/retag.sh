#! /bin/bash

# commit all changes
git add . --all
git ci -am "$2"
# remove old tag
git tag -d $1
git push --tags 
# push changes 
git push 
# create new one
git tag $1 -m "$1"
# push tags
git push --tags 
