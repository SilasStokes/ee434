#!/bin/bash
###############################################################################
# This script sets up the base enviornment for the ICtools helper source
# scripts. Some scripts try to call it if you don't call it before hand.
####
# Major Edits:
# 2015-09-02	Luke Renaud (lrenaud), first draft
###############################################################################
# Location of EVERYTHING important that isn't a PDK itself
export ICTOOLS=/net/ic/tools
export ICPDK=/net/ic/pdk
export ICPROJECTS=/net/ic/proj

EDITOR='vi';

if [[ $EDITOR == "" ]]; then # define an editor if needed
	echo "`basename $BASH_SOURCE`: EDITOR not defined, defaulting to vi."
	EDITOR="vi";
fi


