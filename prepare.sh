#!/bin/bash

# Downloads required software and Lua source code, also applies the patch to be
# compatible with DOS.

BORLAND="BorlandTurboC201-megapack.zip"
LUA="lua-5.4.7"

# Download Bordland Turboc C

if [[ ! -f "$BORLAND" ]]; then
        wget "https://archive.org/download/msdos_borland_turbo_c_2.01/BorlandTurboC201-megapack.zip"
        unzip "$BORLAND"
fi

# Download Lua Source code

if [[ ! -f "$LUA.tar.gz" ]]; then
        wget "https://www.lua.org/ftp/$LUA.tar.gz"
fi

rm -rf lua/
tar -xvf "$LUA.tar.gz"
mv "$LUA" lua

# Patch Lua Source code

echo '/* blank */' > lua/src/locale.h
cd lua/
unix2dos src/* 
unix2dos ../$LUA-for-dos-with-borland-turbo-c-2.01.patch
#unix2dos ../LUA-for-dos-with-borland-turbo-c-2.01.patch32bits

# force using binary to avoid inconsistency with line-endings, by some reason
# unix2dos does not always helps
patch -p1 -i "../$LUA-for-dos-with-borland-turbo-c-2.01.patch" --binary
