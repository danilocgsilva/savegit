#!/bin/bash

## The main entrance for the utility
savegit () {
	check_if_is_in_repository
	check_if_argument_was_provided $1

	git add -A
	git commit -m "$1"
	git push 
}

## Check if the folder is inside a git repository
check_if_is_in_repository() {
	if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		echo The directory is not part of any work tree
		exit
	fi
}

## Check if the user provided the first argument
check_if_argument_was_provided() {
	if [ -z "$1" ]; then
		echo Please, provides the commit comment.
		exit
	fi
}

## detect if being sourced and
## export if so else execute
## main function with args
if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f savegit
else
  savegit "${@}"
  exit $?
fi
