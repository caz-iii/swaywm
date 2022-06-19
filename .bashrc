# .bashrc

#export PS1=\>\ 

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Aliases
alias g="~/code/bash/git.sh"
alias h="~/code/bash/hugo-launcher.sh"

alias ls="ls -ahN --group-directories-first --color=auto"
alias cls="clear"

alias w="curl wttr.in"
alias r="ranger"