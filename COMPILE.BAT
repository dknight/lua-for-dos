PATH=C:\TC
CD C:\LUA\SRC
TCC -w- -ms- -mh -I. -c *.c
DEL LUAC.OBJ
TCC -w- -ms- -mh -eLUA.EXE *.obj
DEL LUA.OBJ
TCC -w- -ms- -mh -I. -c LUAC.C
TCC -w- -ms- -mh -eLUAC.EXE *.OBJ
CD ..
MKDIR BIN
COPY SRC\LUA.EXE BIN
COPY SRC\LUAC.EXE BIN
CD BIN
LUA < "lu"
