regraft ()
{
  about 'copy files in PWD to some other location'
  param '1: location to move files to'
  example '$ regraft ..'
  example '$ regraft /opt/local'
  group 'file'

  tar cf - . | ( cd $1 && tar xf - )
}
