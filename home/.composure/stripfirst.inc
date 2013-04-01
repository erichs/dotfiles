stripfirst ()
{
  about 'remove first column of space-delimited text'
  group 'shell'

  awk '{for (f=2; f<=NF; ++f) { if (f!=2) {printf("%s",OFS);} printf("%s",$f)} printf("\n")}'
}
