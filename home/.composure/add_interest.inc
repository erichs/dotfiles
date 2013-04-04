add_interest ()
{
  about 'adds interest to interests list, for use with ii'
  param '1: interest'
  example '$ add_interest winetasting'
  group 'shell'

  echo "$*" >> ~/.fortune/interests.list
  (
    cd ~/.fortune
    git add interests.list
    git commit -m 'update interests'
  )
}
