#!/bin/bash

# Description: Script for do a git update to gems with path in ruby Gemfile and bundle update into the project
# Author: woohoou
# Date: 15/Mar/2012

for i in `grep ^gem Gemfile | grep path | cut -s -d/ -f2 | cut -s -d\' -f1`
do
	if [ -d "../$i/" ];	then
		echo "########################"
		echo "Git Pull in $i:"
		(cd ../$i/ && git pull)
		echo "Done."
	fi
done

echo "########################"
echo "Git Pull in ./:"
git pull
echo "Done."
echo "########################"
echo "Bundle Update:"
bundle update
echo "Done."
