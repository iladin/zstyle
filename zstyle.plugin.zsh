# zstyle ‘:completion:function:completer:command:argument:tag’

# Do menu-driven completion.
hash dircolors &> /dev/null && zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' list-dirs-first true


# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# ignore completion to commands we don't have
zstyle ':completion:*:functions'          ignored-patterns '_*'

# Use cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

#style’s value will be the description for options not described by functions
zstyle ':completion:*:options' auto-description '%d'

# Refer to your own processes
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
# colorful kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
# zstyle kill menu
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:kill:*'             force-list always




# Color completion for some things.
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
## Highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"
# Highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"
# Highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"
# Colorize hostname completion
zstyle ':completion:*:*:*:*:hosts' list-colors "=*=$color[cyan];$color[bg-black]"


zstyle ':completion:*:cd:*' ignore-parents parent pwd

# completion sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Manpages
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

# formatting and messages
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

zstyle '*' single-ignored show

# With commands like `rm' it's annoying if one gets offered the same filename
# again even if it is already on the command line. To avoid that:
zstyle ':completion::*:(git|less|rm)' ignore-line true

# SSH Completion
zstyle ':completion:*:scp:*' tag-order files 'hosts:-domain:domain'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:(rsync|ssh):*' tag-order 'hosts:-domain:domain'
zstyle ':completion:*:(rsync|ssh):*' group-order hosts-domain hosts-host users hosts-ipaddr

# default: --
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu select
zstyle ':completion:*:*:(cd):*'        completer _history


# Menu select
zmodload -i zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char

#maps reverse-menu-complete to shift-tab
bindkey "${terminfo[kcbt]}" reverse-menu-complete

compdef g='git'
compdef cfg='git'

## From grml

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'