Scripts for creating kernel pull requests.

Install the command and templates with `make install`. Templates are installed
in `$XDG_DATA_HOME/linux-pr` (default: `~/.local/share/linux-pr`). Override
`DATADIR` at installation time to use a different directory; the installed
command records that directory. `DESTDIR` is only a staging prefix.

Select a template by name, without the `.mbox.in` suffix. The name also serves
as the tag prefix:

```sh
linux-pr -n -C ~/work/linux tpm v7.4-rc1
```

`linux-pr --postfix rebased tpm v7.4-rc1` selects `tpm.mbox.in` and creates
the Git tag `tpm-v7.4-rc1-rebased`.

The available names are `keys` and `tpm`. Lookup defaults to the
installed template directory, with no current-directory or checkout fallback.
Use `--data-dir <dir>` to select another template directory explicitly. For
example, when testing from this checkout:

```sh
bin/linux-pr -n --data-dir ./data -C ~/work/linux tpm v7.4-rc1
```
