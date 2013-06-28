files=$(ls ~/.profile.d/*.sh \
           ~/.profile.d/private/*.sh \
           ~/.composure/*.inc \
           ~/.composure/private/*.inc \
           2>/dev/null)

for file in $files; do
    source $file
done

fortune ~/.fortune/*.txt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export readslave_db_passwd=vuEBkt4BndSz
alias v='vagrant'
alias glof='git pull --ff-only origin freeStart'
alias gcob='git checkout -b'
alias gst='git stash'
alias gsp='git stash pop'
alias gss='git stash save'
alias dm='devops merge'
alias dr='devops req'
