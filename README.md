# winged-cd

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

A utilitiy CLI tool that allows for quick changes to distant directories by recursively searching for partial name
matches and performing a `cd` on the first match.

## Setup

To allow in-terminal `cd` to take effect and not being run in a subprocess, a bash script `wcd.sh` has to be run
as `source`. Being an entrypoint, it then calls a python script `wcd_core.py` which includes the logic that returns the
desired path. As a result, both files present in the `src` dir are required.

Both files have to be set as executable:

```bash
$ chmod +x wcd.sh wcd_core.py
```

When used, they are expected to be inside `~/bin`.

To ease and quicken the execution, it is recommended to set up a shortening alias in `~/.bashrc`:

```bash
alias {w,wcd}="source wcd.sh"
```

The example above will accept both `w` and `wcd` as aliases for `source wcd.sh`, allowing for faster usage. Do note
that `w` usually points to `/usr/bin/w` by default. In case you do not want to override this behavior, either
replace `w` with some other character or keep to the `wcd` alias only.

## Usage

Once set up, the usage can be as simple as:

```bash
$ w <dst>
```

Where `dst` is an arbitrary text to match anywhere in the destination directory name.

Help with additional options can be output by passing the `--help` flag:

```bash
$ w --help
```

To illustrate on a simulated filesystem, note the `w --root . quu` line:

```bash
[Foo]$ tree
.
└── Bar
    └── Baz
        ├── Grault
        │   └── Garply
        └── Qux
            └── Quux
                └── Corge

[Foo]$ 
[Foo]$ w --root . quu
[Quux]$ 
[Quux]$ tree
.
└── Corge
```
