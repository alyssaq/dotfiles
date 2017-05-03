export PATH=$HOME/Documents/stuff/dotfiles/scripts:$PATH

# Git completion
if [ -e .git-completion.bash ]; then
  source .git-completion.bash
fi

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[35m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# $ brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# sudo -H pip install virtualenv
# sudo -H pip install virtualenvwrapper
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
if [ -e ~/.bash_exports ]; then
  source ~/.bash_exports
fi
if [ -e ~/.bash_alias ]; then
  source ~/.bash_alias
fi
if [ -e bash_completion_tmux.sh ]; then
  source ./bash_completion_tmux.sh
fi

# Add tab completion for known SSH hostnames
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# SSH Agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  ssh-add
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent
  }
else
  start_agent
fi