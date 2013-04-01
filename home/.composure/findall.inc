findall ()
{
  about "recursively finds all files with named extensions"
  param "*: one or more extensions"
  example "$ findall rb erb coffee"
  group "file"

  spec="-name \*.$1 "
  while shift; do
    if [ -z "$1" ]; then
      break
    fi
    spec="$spec -o -name \*.$1 "
  done

  eval "find . $spec"
}
