[composure](https://github.com/erichs/composure) stores your shell functions here.

For 'sticky' functions that persist between shell invocations, be sure to
include a snippet like the following in your shell startup script:

```bash
  for file in ~/.composure/*.inc; do
    source $file
  done
```

or, to hone in on a specific grouping of functionality, say 'tools':

```bash
  for tool in $(glossary tools | awk '{print $1}'); do
    source ~/.composure/$tool.inc
  done
```
