#!/bin/bash 
#Negro       0;30     Gris Obscuro  1;30
#Azul        0;34     Azul Claro    1;34
#Verde       0;32     Verde Claro   1;32
#Cyan        0;36     Cyan Claro    1;36
#Rojo        0;31     Rojo Claro    1;31
#Purpura     0;35     Fiuscha       1;35
#Café        0;33     Amarillo      1;33
#Gris Claro  0;37     Blanco        1;37

#verde 42
#PS1="────────\n\033[1;37;42m{\H}:\033[0;30;42m \w\033[0;0m \n\[\033[30;47m\][\[\033[1;31m\]\u\[\033[30;47m\]@:\W]$\[\033[00m\](\#)-> "


export TERM=xterm-256color
export EDITOR=vim 
export PS_FORMAT=euser,start,etime,pid,psr,pcpu,bsdtime,pmem,sz,min_flt,maj_flt,vsize,rss,status,cmd  
export GREP_COLOR="1;31"
export PS0
export PS1="\n\033[1;40;37m{\H}\[\033[36;1m\] \w\[\033[0;40;37m\]\n\[\033[1;40;32m\](\u)\[\033[0;37m\]-[\[\033[1;33m\]\#\[\033[00m\]]: " 
export PS1="------------\n\033[1;37;42m{\H}:\033[36m\[\033[00m \w\[\033[0;40;37m\]\n\[\033[1;40;32m\](\u)\[\033[0;37m\]-[\[\033[1;33m\]\#\[\033[00m\]]: "
export PS2="continue-> "
export PS4="-> \011\e[1;34m${BASH_SOURCE}\e[0m:\e[1;36m${LINENO}\e[0m \011 ${FUNCNAME[0]:+\e[0;35m${FUNCNAME[0]}\e[1;30m()\e[0m:\011\011 }"

