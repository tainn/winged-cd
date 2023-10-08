# winged-cd

A utility CLI tool that allows for quick changes to distant directories by recursively searching for partial name
matches and performing a `cd` on the first match.

## Setup

The bash script has to be set as executable.

```console
chmod +x wcd.sh
```

It is recommended to put it inside a directory on the `$PATH`, such as `~/bin`. To allow in-terminal `cd` to take effect
and not being run in a subprocess, `wcd.sh` has to be run as source. To ease and quicken the execution, it is
recommended to set up a shortening alias in `~/.bashrc`.

```bash
alias {w,wcd}=". wcd.sh"
```

The example above will accept both `w` and `wcd` as aliases for `. wcd.sh`. Do note that `w` usually points
to `/usr/bin/w` by default. In case you do not want to override this behavior, either replace `w` with some other
character or keep to the `wcd` alias only.

## Run

Once set up, it can be used with only `dst` being a required argument.

```console
w <dst> [opts]
```

The referenced `dst` is an arbitrary text to match anywhere in the destination directory name.

## Options

There are several options that can be passed as arguments.

```console
options          :: description                       :: type    :: default :: with value?

-r | --root      :: topmost search dir                :: string  :: $PWD    :: true
-s | --sensitive :: force a case-sensitive search     :: boolean :: false   :: false
-d | --dots      :: consider hidden dirs in traversal :: boolean :: false   :: false
```
