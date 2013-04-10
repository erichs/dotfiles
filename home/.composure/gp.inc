gp ()
{
    about 'recursive grep for target';
    param '1: string to search for';
    example '$ gp some_function_name';
    example '$ gp "some string with spaces"';
    group 'shell'

    typeset arg="$1";
    typeset cmd=$(echo "grep -rnIi '$arg' .");
    typeset is_v=0;
    while shift; do
        arg="$1";
        if [[ "$arg" = "" ]]; then
            continue;
        fi;
        if [[ $arg = "-v" ]]; then
            is_v=1;
            continue;
        fi;
        if [[ $is_v = 1 ]]; then
            cmd=$(echo "$cmd | grep -v '$arg'");
        else
            cmd=$(echo "$cmd | grep '$arg'");
        fi;
    done;
    eval $cmd
}
