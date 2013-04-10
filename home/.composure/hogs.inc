hogs () 
{ 
    about 'show disk hogs in current (PWD) directory tree'
    group 'file'

    du -cks * | sort -rn | head -11
}
