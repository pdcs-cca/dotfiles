#!/bin/bash 

complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function

complete -A helptopic  help     # currently same as builtins

