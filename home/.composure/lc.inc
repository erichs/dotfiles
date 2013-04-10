lc () 
{ 
    about 'transforms UPPERCASE text to lowercase'
    example '$ echo "WHEREFORE art thou?" | lc'
    group 'filter'
    
    tr '[:upper:]' '[:lower:]'
}
