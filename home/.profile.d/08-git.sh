alias gl='git l -10'
alias gc='git commit'
alias gs='git status -sb'
alias ga='git add'
alias gd='git diff'
alias grm='git rm'
alias gri='git rebase -i'
alias gpom='git push origin master'
alias glom='git pull origin master'
alias gri='git rebase -i'

gcm() { git commit -m "$*"; }
gcam() { git commit --amend -m "$*"; }