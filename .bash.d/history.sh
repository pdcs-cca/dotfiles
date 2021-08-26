#!/bin/bash

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist
histgrep()
{
  grep -r "$@" ~/.history/
  history | grep "$@"
}

_prompt_command(){
local HISTF="$HOME/.history/$(date  +%Y/%m/%d)_${HOSTNAME}"
test -d $(dirname  $HISTF) || mkdir -p $(dirname  $HISTF)
#test ! -f $HISTF && touch $HISTF
#echo "write in $HISTF "
history -w $HISTF  
#wc -l $HISTF

}

export HISTSIZE=500000
export HISTFILESIZE=500000

# Avoid duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
# export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

# Useful timestamp format
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND="history -a; history -c ; history -r"

