source /etc/profile
#
#######################################
# Options
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#export GTK_IM_MODULE_FILE=/etc/gtk-2.0/gtk.immodules

########################################
# Key Bindings

# Keys.
case $TERM in
    rxvt*)
    bindkey "^[[7~" beginning-of-line #Home key
    bindkey "^[[8~" end-of-line #End key
    bindkey "^[[3~" delete-char #Del key
    bindkey "^[[A" history-beginning-search-backward #Up Arrow
    bindkey "^[[B" history-beginning-search-forward #Down Arrow
    bindkey "^[Oc" forward-word # control + right arrow
    bindkey "^[Od" backward-word # control + left arrow
    bindkey "^H" backward-kill-word # control + backspace
    bindkey "^[[3^" kill-word # control + delete

    # Allow shift-tab to reverse in menu completion
    bindkey '^[[Z' reverse-menu-complete
    ;;

    linux)
    bindkey "^[[1~" beginning-of-line #Home key
    bindkey "^[[4~" end-of-line #End key
    bindkey "^[[3~" delete-char #Del key
    bindkey "^[[A" history-beginning-search-backward
    bindkey "^[[B" history-beginning-search-forward
    ;;
esac

#show mode of the vi-mode of zsh
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

bindkey -v

########################################
# Colors in TTY
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xdefaults | \
               awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

########################################
# Other
autoload -U zmv

########################################
# Options
setopt no_clobber
setopt extendedGlob
setopt hist_ignore_dups
setopt noflowcontrol

########################################
# Exports
source ~/.config/zsh/exports

########################################
# Aliases
source ~/.config/zsh/aliases

#######################################
# Functions
source ~/.config/zsh/functions

#######################################
# Completion
source ~/.config/zsh/completion

########################################
# Prompt
PS1=$'\n%F{cyan}%n%F{white}@%F{magenta}%m %F{yellow}%~ %F{white}%% '
PS2=$'\n%F{red}%_>%F{white}'

export PERL_LOCAL_LIB_ROOT="/home/sanford/perl5";
export PERL_MB_OPT="--install_base /home/sanford/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/sanford/perl5";
export PERL5LIB="/home/sanford/perl5/lib/perl5/x86_64-linux-thread-multi:/home/sanford/perl5/lib/perl5";
export PATH="/home/sanford/perl5/bin:$PATH";
