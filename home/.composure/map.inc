map ()
{
    about 'iteratively pipes input from stdin to the function or process given as argument'
    author 'Mike Ledger, fun.sh'
    param 'function or block of code to map to inputs'
    example 'given function:'
    example 'countdown () { read status; echo "T-minus: $status"; }'
    example 'list {5..1} | map countdown   # displays countdown'
    example 'or, equivalently:'
    example "list {5..1} | map lambda count . 'echo T-minus: \$count' "
    while read x; do
        echo $x | $@;
    done
}
