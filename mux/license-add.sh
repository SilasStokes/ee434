#!/bin/bash
# license-add.sh LICENSE_NUMBER
# A helper file for configuring software.
# Add a license to $LM_LICENSE_FILE, if it's not already there

# If the enviornment already specifies the LICENSE_SERVER variable,
# then we will honor it rather than overriding it locally
if [[ $LICENSE_SERVER == "" ]]; then
	if [[ $HOSTNAME == *"everett"* ]]; then
		# Everett Campus server
		LICENSE_SERVER="linlic1.vcea.wsu.edu"
	else
		# WSU Pullman's default server
		LICENSE_SERVER="linlic1.vcea.wsu.edu"
	fi
fi

# Licence manager setup:
if [[ $LM_LICENSE_FILE != *$1* ]] ; then
    export LM_LICENSE_FILE="${LM_LICENSE_FILE}:$1@$LICENSE_SERVER"
fi # else port already in list
