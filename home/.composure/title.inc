title()
{
  about 'sets terminal title'
  param '1: title to set'
  example '$ title gone with the wind'
  group 'shell'

  echo -ne "\033]0;$*\007"
}
