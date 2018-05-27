
# export DOCKER_HOST=tcp://192.168.59.103:2375

export PATH="$HOME/.rbenv/bin:$PATH"

export XDG_CONFIG_HOME=$HOME/.config # neoVim XDG configuration

eval "$(rbenv init -)"

# Docker Quickstart Terminal を iTerm2 で起動させる

export TERM=xterm-color

alias ls='ls -G'
alias ll='ls -h1'

alias vi='nvim'

export PS1="\[\033[36m\][\u@\h:\W]\$ \[\e[0m\]"

