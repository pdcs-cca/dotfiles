#!/bin/bash 

bash_prompt() {
local NONE="\[\033[0;0m\]"    # unsets color to term's fg color
# regular colors
local K="\[\033[0;30m\]"    # black
local R="\[\033[0;31m\]"    # red
local G="\[\033[0;32m\]"    # green
local Y="\[\033[0;33m\]"    # yellow
local B="\[\033[0;34m\]"    # blue
local M="\[\033[0;35m\]"    # magenta
local C="\[\033[0;36m\]"    # cyan
local W="\[\033[0;37m\]"    # white
# emphasized (bolded) colors
local EMK="\[\033[1;30m\]"
local EMR="\[\033[1;31m\]"
local EMG="\[\033[1;32m\]"
local EMY="\[\033[1;33m\]"
local EMB="\[\033[1;34m\]"
local EMM="\[\033[1;35m\]"
local EMC="\[\033[1;36m\]"
local EMW="\[\033[1;37m\]"
# background colors
local BGK="\[\033[40m\]"
local BGR="\[\033[41m\]"
local BGG="\[\033[42m\]"
local BGY="\[\033[43m\]"
local BGB="\[\033[44m\]"
local BGM="\[\033[45m\]"
local BGC="\[\033[46m\]"
local BGW="\[\033[47m\]"

local UC=$W                 # user's color
[ $UID -eq "0" ] && UC=$R   # root's color
#PS1="${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\$\w ${EMK}]${UC}\\$ ${NONE}"
# without colors: PS1="[\u@\h \$ \w]\\$ "
# extra backslash in front of \$ to make bash colorize the prompt
#PS1="${BGG}${EMW}{\H}: ${EMB}\w\n${BGW}[${EMR}\u@:${EMB}\W]${NONE}(\!,\#)-> "
PS1="══════════\n${BGG}${EMW}{\H}:${NODE}\w\n${NONE}${EMB}(\u)${NONE}-[$EMY\#${NONE}]: "
PS0="══════════\n{\H}: \w\n(\u)-[\#]: "
}

base16_color(){
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1"  ] && [ -s "$BASE16_SHELL/profile_helper.sh"  ] && \
     eval "$("$BASE16_SHELL/profile_helper.sh")"
}

pxesplash(){
[ -z "$1" ] && return

convert -resize 640x480! -depth 16 -colors 65536  "$@"  /tmp/splash.png
display /tmp/splash.png
}

grube(){
[ -z "$1" ] && return

convert -resize 640x480! -depth 8 "$@" /tmp/grube.xpm
convert -colors 14 /tmp/grube.xpm gruby.xpm.gz
display gruby.xpm.gz

}

function ff() { find . -iname '*'$1'*'  2>/dev/null; }                 # find a file
function fe() { find . -iname '*'$1'*' -exec $2 {} \; ; }  # find a file and run $2 on it

bash2map(){
if [ -z $1 ]; then
        echo "Usage: [ip|hostname]"
        return 1
fi

echo -e "bash2map.sh 1.0\n"
echo -e "Port\t\tState\t\tService"

(for ((p=0; p < 1024; p++)); do
 echo "0" >/dev/tcp/$1/$p \
 && service=$( awk -v p=$p '{if ($2 ~p) print $1 }'</etc/services | head -n1 ) \
 && echo -e "$p/tcp\t\topen\t\t$service" >&1;
done) 2>/dev/null
}


P-Q(){
for num in $(seq $1 $2); do for x in $(seq $1 $2); do echo "${num}x${x} $(echo $num*$x | bc)" ; done ; done

}

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[01;38;5;75m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[04;38;5;200m") \
            man "$@"
}


function md() {
	mkdir -p "$@" && cd "$@"
}

function la(){
 	ls -l  "$@" | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
    }'
}

function meml(){                                                                       
for node in /sys/devices/system/node/node* ; do                                        
echo "== 80% $node == "                                                                
echo sqrt \( \( $(awk '/MemTotal:/{print $4}' $node/meminfo ) \* 800 \) / 8 \) | bc    
done                                                                                   
                                                                                       
echo "== 80% /proc/meminfo == "                                                        
echo sqrt \( \( $(awk '/MemTotal:/{print $2}' /proc/meminfo ) \* 800 \) / 8 \) | bc    
}                                                                                      


cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

function copy.tar(){


test -z "$1" && { echo USO  copy.tar DIR [-v] ; return ; }
test ! -d $1 && { echo USO  copy.tar DIR [-v] ; return ; }

test "$2" == "-v" && { find $1  | tar cf - -T - 2>/dev/null | tar xvf - ; return ; }
find $1  | tar cf - -T - 2>/dev/null | pv -W -trb | tar xf - 


}


