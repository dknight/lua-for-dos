REM PATH=C:\LUADOS\TC
REM CD C:\LUADOS\LUA\SRC
PATH=C:\TC
CD C:\LUA\SRC
TCC -w- -ms- -mh -I. -c *.c
DEL LUA.OBJ
TCC -w- -ms- -mh -eLUA.EXE *.obj
TCC -w- -ms- -mh -I. -c LUAC.C
DEL LUA.OBJ
TCC -w- -ms- -mh -eLUAC.EXE *.OBJ
CD ..
MKDIR BIN
DIR
COPY SRC\LUA.EXE BIN
COPY SRC\LUAC.EXE BIN
CD BIN
LUA
for i = 1, i = 10 do print(i) end
# CTRL+C exit
