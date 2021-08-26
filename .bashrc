# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
root_env(){
for file in $HOME/.bash.d/*.sh 
    do source $file
done
}

root_env

