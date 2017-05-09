#!/bin/sh

SHELL_DIR="$( cd "$( dirname "$0" )" && pwd )"

function generate_presentation {
	$SHELL_DIR/node_modules/.bin/cleaver $@
}

npm install

for md in $@
do
	
	generate_presentation "$md"
	
done