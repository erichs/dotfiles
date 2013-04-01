# bashprompt.inc: load colorized, context-sensitive prompt
# eas, 1/2011: initial code
#       2/2012: rewritten for speed, added dingbats for RC and dirty flag
# vim: ft=sh

if [ "$(which git)" == "" ]; then
    return          # this
fi

git_prompt() {
# Emits Git metadata for use in a prompt.
# Based on topfunky's script:
#   https://raw.github.com/topfunky/zsh-simple/master/bin/git-cwd-info
typeset GIT_REPO_PATH=`git rev-parse --git-dir 2>/dev/null`
if [[ $GIT_REPO_PATH != '' && $GIT_REPO_PATH != '~' && $GIT_REPO_PATH != "$HOME/.git" ]]; then
  typeset GIT_BRANCH=`git symbolic-ref -q HEAD | sed 's/refs\/heads\///'`
  typeset GIT_COMMIT_ID=`git rev-parse --short HEAD 2>/dev/null`
  typeset GIT_MODE=""
  if [[ -e "$GIT_REPO_PATH/BISECT_LOG" ]]; then
    GIT_MODE=" +bisect"
  elif [[ -e "$GIT_REPO_PATH/MERGE_HEAD" ]]; then
    GIT_MODE=" +merge"
  elif [[ -e "$GIT_REPO_PATH/rebase" || -e "$GIT_REPO_PATH/rebase-apply" || -e "$GIT_REPO_PATH/rebase-merge" || -e "$GIT_REPO_PATH/../.dotest" ]]; then
    GIT_MODE=" +rebase"
  fi
  typeset GIT_DIRTY=""
  if [[ "$GIT_REPO_PATH" != '.' && `git ls-files -omd` != "" ]]; then
    GIT_DIRTY="${BRIGHT_YELLOW}⚡${RESET}"
  fi
  typeset SINCE_LAST_COMMIT=""
  if [[ ! -z "$GIT_DIRTY" ]]; then
            typeset now=`date +%s`
            typeset last_commit=`git log --pretty=format:'%at' -1`
            typeset seconds_since_last_commit=$((now-last_commit))
            typeset seconds=$seconds_since_last_commit
            typeset _days=$((seconds / 86400)); seconds=$((seconds % 86400)); if [ "$_days" -eq 0 ]; then _days=''; else _days="${_days}d"; fi
            typeset _hours=$((seconds / 3600)); seconds=$((seconds % 3600)); if [ "$_hours" -eq 0 ]; then _hours=''; else _hours="${_hours}h"; fi
            typeset _minutes=$((seconds / 60)); seconds=$((seconds % 60)); _minutes="${_minutes}m"

            typeset LAST_COMMIT_WAS="$_days$_hours$_minutes"
            if [ "$seconds_since_last_commit" -gt 57600 ]; then    # 16 hours
                typeset COLOR=${RED}
            elif [ "$seconds_since_last_commit" -gt 28800 ]; then  #  8 hours
                typeset COLOR=${YELLOW}
            else
                typeset COLOR=${GREEN}
            fi
            SINCE_LAST_COMMIT="${COLOR}${LAST_COMMIT_WAS}${NORMAL}"
  fi
  printf "$GIT_BRANCH $GIT_COMMIT_ID $GIT_MODE $GIT_DIRTY $SINCE_LAST_COMMIT"
fi
}

jobs_prompt() {
    if [ -n "`jobs`" ]; then
        jobs
    fi
}

rc_prompt() {
    if [ $? == 0 ]
    then
        printf "${BRIGHT_GREEN}✓${RESET}"
    else
        printf "${BRIGHT_RED}✖${RESET}"
    fi
}

# prompt based on: http://github.org/kano
_set_up_prompt() {
    typeset c_user
    case "$USER" in
        root) c_user="${RED}" ;;
        *) c_user="${VIOLET}" ;;
    esac
    typeset c_host
    c_host="${GREEN}" ;;

    typeset _title='\[\e]0;\u@\h \w\007\]'
    typeset _host="$c_user\\u${RESET}$c_host@\\h${RESET}"
    typeset _cwd="${YELLOW}\\w${RESET}"
    typeset _main='\$ '

    if [[ 2 -le $SHLVL ]]; then  # is nested interactive shell?
        typeset _shlvl=' ($SHLVL)'
    else
        typeset _shlvl=''
    fi
    if [ -n "$WINDOW" ]; then  # auto-title in GNU screen
        typeset _autotitle='\ek\e\\'
    else
        typeset _autotitle=''
    fi
    # NB: this whole git prompt trick depends on escaping
    # the $(git_prompt) expansion, so is survives to be
    # interpreted anew by the shell each time the
    # prompt is rendered
    typeset _gitinfo="${GREEN}\$(git_prompt)${RESET}"
    typeset _jobinfo="${RED}\$(jobs_prompt)${RESET}"

    PS1="$_autotitle$_title
\$(rc_prompt) $_host $_cwd$_shlvl
$_gitinfo $_jobinfo
$_main"
    PS2='> '
    PS4='+ '
}


_set_up_prompt
unset -f _set_up_prompt
