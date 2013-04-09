personal dotfiles, uses the [homesick
project](https://github.com/technicalpickles/homesick) layout.

On a fresh OSX machine, you'll likely need to [bootstrap a few
tools](http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/),
first.

Once you've got basic tools installed, try:

```bash
$ curl -L git.io/homeshick | sh
$ ~/.homeshick clone erichs/dotfiles
$ ~/.homeshick link dotfiles
```

