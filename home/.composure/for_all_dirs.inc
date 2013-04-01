for_all_dirs ()
{
    about 'maps command argument to all dirs'
    param '1: optional -r, for recursive)'
    param '2: command to execute'
    group 'shell'

    typeset dir
    if [ "$1" = '-r' ]; then
        shift
        for dir in $(find . -type d)
        do
            echo "processing $dir..."
            cd "$dir"
            $*
            cd ..
        done
    else
        for dir in */
        do
            echo "processing $dir..."
            cd "$dir"
            $*
            cd ..
        done
    fi
}
