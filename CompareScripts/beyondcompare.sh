#! /usr/bin/env bash

# Shell script shim to let Beyond\ Compare.app (currently in beta on the mac: http://www.scootersoftware.com/beta.php?zz=beta4_dl) to integrate with
# Tower.app
#
# Tower.app gives us these parameters:
LOCAL="$1"
REMOTE="$2"
BASE="$3"
MERGE_RESULT="$4"

if [ -z $BASE ]; then
    /usr/local/bin/bcomp "$1" "$2"
else
    /usr/local/bin/bcomp "$1" "$2" "$3" "$4" 
fi
