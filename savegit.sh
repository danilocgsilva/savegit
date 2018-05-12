#!/bin/bash

savegit () {
	if [ -z "$1" ]; then
		echo Please, provides the commit comment.
		exit
	fi

	git add -A
	git commit -m "$1"
	git push 
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