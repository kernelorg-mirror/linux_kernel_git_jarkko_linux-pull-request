Scripts for creating kernel pull requests.

Install the command and templates with `make install`. Templates are installed
in `$XDG_DATA_HOME/linux-pr` (default: `~/.local/share/linux-pr`). Override
`DATADIR` at installation time to use a different directory; the installed
command records that directory. `DESTDIR` is only a staging prefix.

Select a template by name, without the `.mbox.in` suffix:

```sh
linux-pr -n -C ~/work/linux tpmdd v7.4-rc1 linux-tpmdd
```

The available names are `keyrings` and `linux-tpmdd`. Lookup defaults to the
installed template directory, with no current-directory or checkout fallback.
