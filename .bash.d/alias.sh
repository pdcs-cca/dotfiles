#!/bin/bash

alias clush="clush -o -q " 
alias vi="vim -Nn " 
alias ..='cd ..'
alias du='du -h --max-depth=1'
alias df='df -h'
alias psl="ps axo pid,ppid,pmem,args"
alias psf="ps awwfux"
alias lk='ls -lSr'		# sort by size
alias lt='ls -ltr'		# sort by date
alias more='less'
alias last10='last -n10'
alias last20='last -n20'
alias ls='ls --color'
alias tailm='tail /var/log/messages'
alias tailmf='tailf /var/log/messages'
alias dateh='date --help|sed -n "/^ *%%/,/^ *%Z/p"|while read l;do F=${l/% */}; date +%$F:"|'"'"'${F//%n/ }'"'"'|${l#* }";done|sed "s/\ *|\ */|/g" |column -s "|" -t'
alias -- -='cd -'
alias ls="ls --color --group-directories-first -F"
alias lsd='ls -l | grep "^d"'
