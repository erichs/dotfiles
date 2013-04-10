lastcol () 
{ 
    about 'prints last column of text';
    group 'filter';
    awk '{print $NF}'
}
