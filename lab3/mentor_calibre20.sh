#!/bin/bash
###############################################################################
# This document sets up the enviornment for use of Mentor Calibre. Note that
# the usage of AOI/IXL represent the Redhat 5 and Redhat 6/7 releases
# respectively. Both 64-bit and 32-bit binaries are contained in the same
# packages though.
#
# If you're looking for information on how to add the Calibre Menu to your 
# Cadence Virtuoso Enviornment, seek out the file named skillREADME for
# instructions inside the CDS_HOME directory. As of writing (Jan 14, 2016)
# this file is at shared/pkgs/icv.aoi/tools/queryskl/skillREADME, and outlines
# what to add to .cdsinit to get things working as desired.
# 
# In a nutshell, the file should point you to perform a load function on
# a calibre.skl (or calibre.OA.skl) file.
####
# Major Edits:
# 2015-12-16	Luke Renaud (lrenaud), first draft
# 2016-09-16	Luke, updated for 2016 releases
# 2017-06-13	Luke, added the path so we can run Calibre manually at the command line
# 2017-07-14	Luke, updated for 2017 releases
# 2020-08-20 	Mokri, Updated for release 2020.03
###############################################################################
if [[ $ICTOOLS == "" ]]; then
	echo "`basename $BASH_SOURCE`: ERROR: ICTOOLS isn't defined!"
	echo "    Please source ictools_generic.sh, before sourcing this script."
	return
fi

# First add the port for this product's license
source $ICTOOLS/sh_scripts_New/license-add_Mentor.sh 27018

# Mark 64-bit use. Generally this should be a given.
if [ `uname -i` == "x86_64" ] ; then
    export USE_CALIBRE_64=YES
fi

##### Calibre Core Setup
# Define the current product
if [[ $CALIBRE_HOME == "" ]]; then
	export CALIBRE_HOME=`readlink -f ${ICTOOLS}/mentor/calibre_2020_aoi`
else
	echo "`basename $BASH_SOURCE`: Using given CALIBRE_HOME=${CALIBRE_HOME}"
fi

# Define the current product
if [[ $MGC_HOME == "" ]]; then
	#echo "`basename $BASH_SOURCE`: MGC_HOME undefined, using CALIBRE_HOME as MGC_HOME"
	export MGC_HOME=$CALIBRE_HOME
else
	echo "`basename $BASH_SOURCE`: MGC_HOME given as: MGC_HOME=${MGC_HOME}"
fi

# Define the default PDF reader for documentation unles the user already has done so.
if [[ "$MGC_PDF_READER" == "" ]]; then
	export MGC_PDF_READER="gnome-open"
fi

### Add this install's path information for the cadence binaries, but only if
### they aren't already present.
toolkit_path=$CALIBRE_HOME/bin

# Add binaries
source $ICTOOLS/sh/path-strip.sh "$toolkit_path"
export PATH=$PATH:$toolkit_path

export MGC_CALIBRE_REALTIME_VIRTUOSO_ENABLED=1
export OA_PLUGIN_PATH=${MGC_HOME}/shared/pkgs/icv/tools/queryskl
export LD_LIBRARY_PATH=$MGC_HOME/shared/pkgs/icv/tools/calibre_client/lib/64:${LD_LIBRARY_PATH}


