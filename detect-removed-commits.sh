#!/bin/bash
declare -A glog
declare -A gfile
#for f in `find .git/objects/??/ -type f | sed 's/\(.*\)\/\([[:xdigit:]]\{2\}\)\/\([[:xdigit:]]\+\)$/\2\3/g'`
for f in `git cat-file --unordered --batch-all-objects --buffer --batch-check | grep ' commit ' | awk '{print $1}'`
do
  gfile[$f]=1
done
for f in `git rev-list --all --remotes`
do
  glog[$f]=1
done
missing=''
for f in "${!gfile[@]}"
do
  got=${glog[$f]}
  if [ ! "$got" = "1" ]
  then
    if [ -z "${missing}" ]
    then
      missing="$f"
    else
      missing="${missing} ${f}"
    fi
  fi
done
if [ ! -z "${missing}" ]
then
  echo "${missing}"
fi
