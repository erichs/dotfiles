product ()
{
    about 'multiplies together a space-separated list of numbers'
    author 'Mike Ledger, fun.sh'
    example 'list {1..5} | product'
    group 'functional'

    reduce lambda a b . 'echo $(($a*$b))'
}
