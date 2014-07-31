#! /usr/bin/env bash

# Shell script shim to let Beyond\ Compare.app (currently in beta on the mac: http://www.scootersoftware.com/beta.php?zz=beta4_dl) to integrate with
# Tower.app
#
# Tower.app gives us these parameters:
LOCAL="$1"
REMOTE="$2"

# Sanitize LOCAL path
if [[ ! "$LOCAL" =~ ^/ ]]; then
	LOCAL=$(echo "$LOCAL" | sed -e 's/^\.\///')
	LOCAL="$PWD/$LOCAL"
fi

# Sanitize REMOTE path
if [[ ! "$REMOTE" =~ ^/ ]]; then
	REMOTE=$(echo "$REMOTE" | sed -e 's/^\.\///')
	REMOTE="$PWD/$REMOTE"
fi

MERGING="$4"
BACKUP="/tmp/$(date +"%Y%d%m%H%M%S")"

BCOMP=`which bcomp`
BCOMPARE=`which bcompare`

if [ ! $BCOMP > /dev/null ] ; then
  if [ -e '/usr/local/bin/bcomp' ] ; then
    BCOMP='/usr/local/bin/bcomp'
  fi
fi

if [ ! -x "$BCOMP" ]; then    
  echo "Beyond Compares's command line tool 'bcomp' could not be found. Please make sure it has been installed in /usr/local/bin/." >&2
  exit 128
fi

if [ -n "$MERGING" ]; then
  BASE="$3"
  MERGE="$4"

  # Sanitize BASE path
  if [[ ! "$BASE" =~ ^/ ]]; then
    BASE=$(echo "$BASE" | sed -e 's/^\.\///')
    BASE="$PWD/$BASE"

    if [ ! -f "$BASE" ]; then
      BASE=/dev/null
    fi
  fi

  # Sanitize MERGE path
  if [[ ! "$MERGE" =~ ^/ ]]; then
    MERGE=$(echo "$MERGE" | sed -e 's/^\.\///')
    MERGE="$PWD/$MERGE"

    if [ ! -f "$MERGE" ]; then
      # For conflict "Both Added", Git does not pass the merge param correctly in current versions
      MERGE=$(echo "$LOCAL" | sed -e 's/\.LOCAL\.[0-9]*//')
    fi
  fi

  sleep 1 # required to create different modification timestamp
  touch "$BACKUP"
  
  "$BCOMP" -ro1 -ro2 -title1="HEAD - $LOCAL" -title2="Merging in - $REMOTE" -title3="Base - $BASE" "$LOCAL" "$REMOTE" "$BASE" "$MERGE"
else
  MERGE="$3"

  if [ -n "$MERGE" ]; then
      #"$BCOMP" -ro1 -ro2 -title1="Remote - $REMOTE" -title2 "Local - $LOCAL" -title3 "Base - $MERGE" "$REMOTE" "$LOCAL" "$MERGE"
      #"$BCOMP" -ro1 -ro2 "$REMOTE" "$LOCAL" "$MERGE"
      "$BCOMP" -vcs1="$MERGE" -ro1 -title1="Local - $LOCAL" -title2="Remote - $MERGE" "$LOCAL" "$REMOTE"
  else
      "$BCOMP" -ro1 -title1="Local - $LOCAL" -title2="Remote - $REMOTE" "$LOCAL" "$REMOTE"
  fi  
fi

if [ -n "$MERGING" ]; then
  # Check if the merged file has changed
  if [ "$MERGE" -ot "$BACKUP" ]; then
    exit 1
  fi
fi

exit 0
