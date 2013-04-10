line () 
{ 
    about 'displays line of input from script'
    param '1: line number'
    example '$ cat script.sh | line 43'
    group 'filter'
    head -$1 | tail -1
}
