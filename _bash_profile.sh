
#	Description:	Bash Profile										#
# ======================================================================#

# ======================================================================#
#	Exports																#
# ======================================================================#
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/latest/bin/:/usr/local/go/bin:/Users/teemal/Dev/flutter/bin
export EDITOR='subl'

source ~/.alias-list
source ~/.brew-application-additions
source ~/.custom-prompt
#source ~/.git-branch-info


# ======================================================================#
#	Tab Completion														#
# ======================================================================#
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

#react native and android studio path variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#GO path variable
export GOPATH=$HOME/Dev/go/


#openVPN PATH variable
export PATH="/usr/local/Cellar/openvpn/2.4.6/sbin:$PATH"

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

#=====ALIASES=======
#--school servers
alias flip='ssh mallorta@flip1.engr.oregonstate.edu'
alias os1='ssh mallorta@os1.engr.oregonstate.edu'
alias scpmallorta='scp mallorta@flip1.engr.oregonstate.edu'

#--git
alias gs='git status'
alias ga='git add .'
alias gcm='git commit -m'
alias gpushm='git push origin master'
alias gpushd='git push origin dev'
alias gpullm='git pull origin master'
alias gpulld='git pull origin dev'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
#==================

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d'  -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[0;97m\]\u: \[\033[0;35m\]\w\[\033[0;97m\]\n\[\033[1;96m\]¯\_(ツ)_/¯ \[\033[0m\]\n\[\033[32m\]branch =>$(parse_git_branch)\n '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*




##
# Your previous /Users/teemal/.bash_profile file was backed up as /Users/teemal/.bash_profile.macports-saved_2019-08-23_at_19:18:32
##

# MacPorts Installer addition on 2019-08-23_at_19:18:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

