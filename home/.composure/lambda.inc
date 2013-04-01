lambda ()
{
    about 'executes an anonymous function using arguments as function body'
    param '1: optional lambda arguments, followed by a period or colon'
    param '2: code for function body'
    example 'ls -l | awk "{print \\$5}" | map lambda a : "echo bytes: \\$a" '

    function lam ()
    {
        unset last;
        unset ars;
        for last in "$@";
        do
            shift;
            if [[ $last = "." || $last = ":" || $last = "->" || $last = "→" ]]; then
                echo "$@";
                return;
            else
                echo "read $last;";
            fi;
        done
    };
    y="stdin";
    for i in "$@";
    do
        if [[ $i = "." || $i = ":" || $i = "->" || $i = "→" ]]; then
            y="args";
        fi;
    done;
    if [[ "$y" = "stdin" ]]; then
        read fun;
        eval $(lam "$@ : $fun");
    else
        eval $(lam "$@");
    fi;
    unset y;
    unset i;
    unset fun
}
