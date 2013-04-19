sl ()
{
    about 'reissues last command from history with SUDO privileges'
    group 'shell'

    typeset last=$(fc -ln -1)
    sudo $last
}
