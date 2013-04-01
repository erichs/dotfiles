sum ()
{
    about 'sums a line-separated list of numbers'
    author 'Mike Ledger, fun.sh'
    example 'list {1..5} | sum'
    group 'functional'

    reduce lambda a b . 'echo $(($a + $b))'
}
