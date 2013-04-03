while-success ()
{
  about 'executes argument while the execution of that argument returns status 0'
  param '1: command(s) to execute'
  example '$ while-success some_long_running_process'
  group 'shell'

  # NOP always succeeds--clears $?
  :
  while [ "$?" -eq "0" ]; do
    $*
  done
}
