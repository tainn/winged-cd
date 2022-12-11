#!/usr/bin/env python3

import os
import sys
from argparse import ArgumentParser, Namespace
from pathlib import Path


def main() -> None:
    sys.stderr = sys.stdout  # required for bash capture
    args: Namespace = parse_args()
    find_dst_dir(args)


def parse_args() -> Namespace:
    parser: ArgumentParser = ArgumentParser()

    parser.add_argument(
        "dst",
        help="destination directory basename",
        type=str,
        metavar="dst",
    )
    parser.add_argument(
        "-r",
        "--root",
        help=f"topmost search dir, default to {os.getenv('HOME')}",
        type=str,
        default=os.getenv("HOME"),
    )
    parser.add_argument(
        "-s",
        "--sensitive",
        help="force a case-sensitive search",
        action="store_true",
        default=False,
    )
    parser.add_argument(
        "-d",
        "--dots",
        help="consider hidden dirs in traversal",
        action="store_true",
        default=False,
    )

    return parser.parse_args()


def find_dst_dir(args: Namespace) -> None:
    for root, dirs, _ in os.walk(args.root):
        for dir_ in dirs:
            abs_path: Path = Path(root) / dir_

            if not args.dots and "/." in str(abs_path):
                continue

            if not args.sensitive:
                args.dst = args.dst.lower()
                dir_: str = dir_.lower()

            if args.dst in dir_:
                print(abs_path)
                return


if __name__ == "__main__":
    main()
