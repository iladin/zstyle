# Do menu-driven completion.
zstyle ':completion:*' menu select

# Use cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

#style’s value will be the description for options not described by functions
zstyle ':completion:*:options' auto-description '%d'

# Refer to your own processes
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
# colorful kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
