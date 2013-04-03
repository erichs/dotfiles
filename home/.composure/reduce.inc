reduce ()
{
    about 'iteratively pipes input from stdin through function argument, accumulating result'
    author 'Mike Ledger, fun.sh'
    param 'function or block of code to accumulate over inputs'
    example 'sum all even numbers in input list:'
    example "list {0..50} | reduce lambda a b . 'if [ \$((\$b % 2)) -eq 0 ]; then echo \$((\$a + \$b)); else echo $a; fi'"
    group 'functional'

    f="$@";
    read acc;
    while read elem; do
        acc="$(echo -e "$acc\n$elem" | $f)";
    done;
    echo "$acc"
}
