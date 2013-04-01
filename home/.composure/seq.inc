seq ()
{
    about 'generates sequence of numbers'
    param '1: start of sequence'
    param '2: end of sequence'
    example '$ seq 1 10'

    if [ -n "$(which seq)" ]; then
        echo 'calling built-in'
        command seq $*
        return $?
    fi

    if [ $# -lt 2 ]; then
        reference $FUNCNAME
        return 1
    fi

    for i in $(eval echo {$1..$2})
    do
        echo $i
    done
}
