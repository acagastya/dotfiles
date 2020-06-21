local ret_status=" %(?:😁:🤬) "
PROMPT='${ret_status}$fg_bold[cyan]$FG[45]%c$reset_color $(git_prompt_info)
 $fg_bold[blue]$FG[118]✓  Okay!${reset_color}
 $FG[220]λ${reset_color} '

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[033]git:($fg_bold[red]$FG[196]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$reset_color$fg[blue]$FG[033]) $fg[yellow]$FG[226]✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$reset_color$fg[blue]$FG[033])"