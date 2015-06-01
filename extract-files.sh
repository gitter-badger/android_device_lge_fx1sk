#!/bin/sh

VENDOR=lge
DEVICE=fx1sk

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat Addon/proprietary-blobs.txt | grep -v ^# | grep -v ^$ `; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp ../../../firmware/$FILE $BASE/$FILE
done

./setup-makefiles.sh
