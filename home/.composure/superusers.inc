superusers ()
{
  about 'displays list of root-level accounts'
  group 'shell'

  awk -F: '$3 == 0 {print $1}' /etc/passwd
}
