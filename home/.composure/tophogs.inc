tophogs ()
{
  about 'shows top 20 disk hogs in current directory'
  group 'file'
  du -sk * | sort -nr | head -20
}
