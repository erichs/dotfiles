progress ()
{
    about 'toggles progress display for cp/mv commands'
    group 'files'
    if [ "$PROGRESS_MODE" == "ON" ]; then
      unalias cp
      unalias mv
      export PROGRESS_MODE='OFF'
      echo 'Display progress for cp/mv: OFF'
    else
      alias cp='rsync -aP'
      alias mv='rsync -aP --remove-source-files'
      export PROGRESS_MODE='ON'
      echo 'Display progress for cp/mv: ON'
    fi
}
