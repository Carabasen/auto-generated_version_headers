#!/bin/sh
set -e

CDATE=$(date +%d.%m.%Y)
VER=$(git describe --tags --always --dirty --long --abbrev=7)

FNAME="$1"
FNAME_TMP="$1.new"
GUARD=generated_version_header

echo '#ifndef' $GUARD > $FNAME_TMP
echo '#define' $GUARD >> $FNAME_TMP
echo '/* Automatically generated file, do not modify! */' >> $FNAME_TMP
echo '#define SOFTWARE_VERSION' \"$VER $CDATE\" >> $FNAME_TMP
echo '#endif' >> $FNAME_TMP

if ! cmp -s "$FNAME_TMP" "$FNAME";
then
	cp -f "$FNAME_TMP" "$FNAME"
fi

rm -f "$FNAME_TMP"
