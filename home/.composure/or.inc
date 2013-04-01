or ()
{
    about 'performs set UNION operation on two lists';
    param '1: filename or process substitution containing list';
    param '2: filename or process substitution containing list';
    example '$ or /tmp/file1 /tmp/file2';
    example '$ or <(ls /dir1) <(ls /dir2)';
    if [ $# -lt 2 ]; then
        reference $FUNCNAME
    fi
    comm -3 $* | sed 's/^[[:space:]]*//g'
}
