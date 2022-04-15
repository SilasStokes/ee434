#!/bin/bash
###############################################################################
# This script tries to configure synopsys tools. If you pass arguments to the
# script it will only try to configure tools passed via the arguments.
####
# Major Edits:
# 2015-09-11	Luke Renaud (lrenaud), first draft based on Dirk's old script
# 2017-04-14	Luke Renaud (lrenaud), updated to draw in man-pages if present
###############################################################################
# Current Setup:
#	autoconfigure licensing tools and coretools
#	configure requested components or all in the following order
#		hspice, syn (syntehsis), vcs
#
###############################################################################
if [[ $ICTOOLS == "" ]]; then
	echo "$(basename "$BASH_SOURCE"): ERROR: ICTOOLS isn't defined!"
	echo "    Please source ictools_generic.sh, before sourcing this script."
	return
fi

# add the license
source "license-add.sh" 27020

SYN="$ICTOOLS/synopsys"
SYN2=/net/ic/tools/synopsys

# First add the core tools which are always required
# Remove any old versions in the path first
source "$ICTOOLS/sh/path-strip.sh" *"${SYN}/coretools"*
export PATH=$PATH:$SYN/coretools/bin

# Then check for common licensing (scl)
if (( $# == 0 )) || [[ $* == *scl* ]]; then
	if ! which lmstat >/dev/null 2>&1
	then
		# Remove any old versions in the path first
		source "$ICTOOLS/sh/path-strip.sh" */scl/*
		export PATH=$PATH:$SYN/scl/linux64/bin
	fi
fi

# A helper function to search for the "man" directories inside of
# the synopsys documentation directories
function man_search() {
	if [[ "$1" == "" ]]; then
		return; # must specify a search path
	else
		MAN_SEARCH_PATH="${1}/doc"
	fi
	
	if [[ ! -e "${MAN_SEARCH_PATH}" ]]; then
		return; # search path doesn't even exist
	fi

	# First strip out all of the old man pages for this tool
	source "${ICTOOLS}/sh/path-strip-man.sh" "$1"

	# do a double depth folder only search and extract MAN pages
	FOUND_MAN_PATHS=($(find "${MAN_SEARCH_PATH}" -maxdepth 2 -type d -name man))
	for NEW_PATH in ${FOUND_MAN_PATHS[@]}; do
		export MANPATH="${MANPATH}:${NEW_PATH}"
	done
}

# List all possible components that have no special configuration
# Any tools that require extra configuration are configured later on
# explicitly.
COMPOENTS=(hspice syn)
# Loop through each component
for COMPONENT in ${COMPOENTS[*]}; do
	# If there are no requests, then accept all components, otherwise
	# we will simply install requested components
	if (( $# == 0 )) || [[ $* == *$COMPONENT* ]]; then
		COMP_VER_STR=$(basename $(readlink "$SYN/$COMPONENT"))
		echo "$(basename "$BASH_SOURCE"): adding component \"$COMPONENT\" (ver $COMP_VER_STR)"
		# Remove any old versions in the path first
		source "$ICTOOLS/sh/path-strip.sh" */$COMPONENT/*
		if [[ "$COMPONENT" == "hspice" ]]; then
			export PATH=$PATH:$SYN/$COMPONENT/hspice/bin
      export PATH=$PATH:${SYN2}/releases/F-2011.09_custExplorer/bin
		#elif [[ "$COMPONENT" == "prime" ]]; then
      #export PATH=$PATH:${SYN2}/releases/prime/R-2020.09/bin
		else
			export PATH=$PATH:$SYN/$COMPONENT/bin
		fi

		man_search "$SYN/$COMPONENT"
	fi
done

COMPONENT=prime
if (( $# == 0 )) || [[ $* == *$COMPONENT* ]]; then
	export PATH=$PATH:${SYN2}/releases/prime/R-2020.09/bin
fi

COMPONENT=lib_com
if (( $# == 0 )) || [[ $* == *$COMPONENT* ]]; then
	export PATH=$PATH:${SYN2}/releases/lc/Q-2019.12-SP5/bin
fi

COMPONENT=vcsmx
if (( $# == 0 )) || [[ $* == *$COMPONENT* ]]; then
	COMP_VER_STR=$(basename $(readlink $SYN/$COMPONENT))
	echo "$(basename "$BASH_SOURCE"): adding component \"$COMPONENT\" (ver $COMP_VER_STR)"
	# Remove any old versions in the path first
	source $ICTOOLS/sh/path-strip.sh */$COMPONENT/*
	export VCS_HOME=$SYN/$COMPONENT
	export PATH=$PATH:$SYN/$COMPONENT/bin

	man_search "$SYN/$COMPONENT"
fi


