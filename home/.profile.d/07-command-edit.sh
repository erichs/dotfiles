# use vi mode at prompt
set -o vi

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history

# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete

# edit command in editor
bind '"\C-j": edit-and-execute-command'

# ctrl-l clears screen
bind -m vi-insert "\C-l":clear-screen
