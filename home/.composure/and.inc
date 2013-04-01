and ()
{
    about 'performs set INTERSECTION on two lists'
    param '1: filename or process substitution containing list'
    param '2: filename or process substitution containing list'
    example '$ and /tmp/file1 /tmp/file2'
    example '$ and <(ls /dir1) <(ls /dir2)'
    if [ $# -lt 2 ]; then
        reference $FUNCNAME
    fi
    comm -12 $*
}
