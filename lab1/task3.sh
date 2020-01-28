#!/bin/bash

reg1="^.{8,}$"
reg2="^.*([0-9].*[@#\$%&*+=-]|[@#\$%&*+=-].*[0-9]).*$"
reg3="^.*(1234|4321|user|pass|admi|word|qwer).*$"

if [[ "$@" =~ $reg1 && "$@" =~ $reg2 && ! "$@" =~ $reg3 ]]
then
	echo "match"
else
	echo "not match"
fi
