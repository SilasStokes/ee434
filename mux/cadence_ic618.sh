#!/bin/bash
###############################################################################
# This script sets up your enviornment to include the path and man pages that
# cadence needs to run the core tools in IC6. Suplement packages must be
# added seperately.
####
# Major Edits:
# 2015-09-02	Luke Renaud (lrenaud), first draft
# 2015-12-16	Luke Renaud (lrenaud), made scripts consistant in structure
# 2015-03-18	Luke Renaud, added warnings if .cdsenv sim output is not set to /tmp
###############################################################################
# Current Setup:
#	Add license when not defined
#	Allow user override of IC6 install path
#	Use 64-bit binaries when possible
#	Include man pages
#	Update path variable
#
###############################################################################
if [[ $ICTOOLS == "" ]]; then
	echo "`basename $BASH_SOURCE`: ERROR: ICTOOLS isn't defined!"
	echo "    Please source ictools_generic.sh, before sourcing this script."
	return
fi

# This check is disabled, as our undergrads might cause a server to barf by filling
# up it's hard drive rather than their home directory. We should only run it for 
# researchers. At a later date we'll do a check based upon the `groups` command,
# to do the check when it's appropreate. -Luke
#$ICTOOLS/sh/checks/cadence_checkCDSenv.sh

# First add the port for this product's license
source $ICTOOLS/sh/license-add.sh 27012

# Enable 64-bit on 64-bit boxes
if [[ $( uname -a ) == *"x86_64"* ]]; then export CDS_AUTO_64BIT=ALL; fi

##### IC6 Core Setup
### To get configuration files for your home look in the installation directory
### ($CDSHOME) in the location $CDSHOME/tools.xxx/dfII/cdsuser/

# Define the current product
if [[ $CDSHOME == "" ]]; then
	export CDSHOME=`readlink -f ${ICTOOLS}/cadence/releases/IC_06.18.130`
else
	echo "`basename $BASH_SOURCE`: Using given CDSHOME=${CDSHOME}"
fi

### Add this install's path information for the cadence binaries, but only if
### they aren't already present.
toolkit_manpages=$CDSHOME/tools/dfII/man
toolkit_path=$CDSHOME/tools/dfII/bin:$CDSHOME/tools/bin

# Add manpages
if [[ $MANPATH != *$toolkit_manpages* ]]; then
	if [[ $MANPATH == "" ]]; then
		export MANPATH=$toolkit_manpages
	else
		export MANPATH=$MANPATH:$toolkit_manpages
	fi
fi
# Add binaries
source $ICTOOLS/sh/path-strip.sh "$toolkit_path"
export PATH=$PATH:$toolkit_path

unset toolkit_path
unset toolkit_manpages
