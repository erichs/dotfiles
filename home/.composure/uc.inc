uc () 
{ 
    about 'transforms lowercase text to UPPERCASE'
    example '$ echo "WHEREFORE art thou?" | uc'
    group 'filter'
    
    tr  '[:lower:]' '[:upper:]'
}
