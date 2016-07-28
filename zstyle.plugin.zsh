# Do menu-driven completion.
zstyle ':completion:*' menu select

# Use cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

#style’s value will be the description for options not described by functions
zstyle ':completion:*:options' auto-description '%d'
