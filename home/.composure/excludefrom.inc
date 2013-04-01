excludefrom ()
{
    about 'subtract right-hand list from left-hand list'
    param '1: filename or process substitution containing list';
    param '2: filename or process substitution containing list';
    example '$ excludefrom /tmp/file1 /tmp/file2';
    example '$ excludefrom <(ls /dir1) <(ls /dir2)';
    group 'functional'

    if [ $# -lt 2 ]; then
        reference $FUNCNAME
    fi

    comm -23 $*
}
