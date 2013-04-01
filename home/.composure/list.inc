list ()
{
    about 'converts space-delimited input arguments to line-separated list'
    author 'Mike Ledger, fun.sh'
    example 'list one two three'
    example 'list {1..10}'
    group 'shell'

    for i in "$@";
    do
        echo "$i";
    done
}
