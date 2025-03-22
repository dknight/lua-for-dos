#!/bin/bash

BORLAND="BorlandTurboC201-megapack.zip"
LUA="lua-5.4.7"

if [[ ! -f "$BORLAND" ]]; then
	wget "https://archive.org/download/msdos_borland_turbo_c_2.01/BorlandTurboC201-megapack.zip"
	unzip "$BORLAND"
fi

if [[ ! -f "$LUA.tar.gz" ]]; then
	wget "https://www.lua.org/ftp/$LUA.tar.gz"
fi

rm -rf lua/
tar -xvf "$LUA.tar.gz"
mv lua-5.4.7 lua

echo '/* blank */' > lua/src/locale.h
cd lua/
unix2dos src/* 
unix2dos ../lua-5.4.7-for-dos-with-borland-turbo-c-2.01.patch

# force using binary to avoid incositency with line-endinds, by some reason
# unix2dos does not always helps
patch -p1 -i "../lua-5.4.7-for-dos-with-borland-turbo-c-2.01.patch" --binary

