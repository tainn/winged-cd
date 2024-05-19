# winged-cd

a utility cli tool that allows for quick changes to distant directories by recursively searching for partial name
matches and performing a `cd` on the first match

## setup

the bash script has to be set as executable:

```console
chmod +x wcd.sh
```

it is recommended to put it inside a directory on the `$PATH`, such as `~/bin`. to allow in-terminal `cd` to take effect
and not being run in a subprocess, `wcd.sh` has to be run as source. to ease and quicken the execution, it is
recommended to set up a shortening alias in `~/.bashrc`:

```bash
alias {w,wcd}=". wcd.sh"
```

the example above will accept both `w` and `wcd` as aliases for `. wcd.sh`. do note that `w` usually points
to `/usr/bin/w` by default. in case you do not want to override this behavior, either replace `w` with some other
character or keep to the `wcd` alias only

## run

once set up, it can be used with only `dst` being a required argument:

```console
w <dst> [opts]
```

the referenced `dst` is an arbitrary text to match anywhere in the destination directory name

## options

there are several options that can be passed as arguments:

```console
options        :: description                       :: type    :: default :: expect value

-r/--root      :: topmost search dir                :: string  :: $PWD    :: true
-s/--sensitive :: force a case-sensitive search     :: boolean :: false   :: false
-d/--dots      :: consider hidden dirs in traversal :: boolean :: false   :: false
```
