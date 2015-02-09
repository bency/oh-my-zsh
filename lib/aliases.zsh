# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias d='ls'
alias dl='ls -lh'
alias da='ls -lAh'

alias afind='ack-grep -il'

alias saqua='mosh aqua.srv.pixnet'
alias sirc='mosh --ssh="ssh -p 222" irc.pixnet.tw'
alias mario='mosh mario.bency.org'
alias jccf='ssh jccf.bency.org'
