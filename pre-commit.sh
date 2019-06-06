#!/bin/bash

ON_COMMIT=$(git config --get sniff.oncommit)

if [ ! -z "$ON_COMMIT" ] && [ $ON_COMMIT -eq 1 ]; then
	git sniff
	exit $?
fi
