#!/usr/bin/env xonsh

import sys, argparse
from sys import exit

parser = argparse.ArgumentParser(description='build')
parser.add_argument('-q', '--quiet', action='store_true', help=f"Quiet mode")
opt = parser.parse_args()

plugin_path = pf"{__file__}".absolute().parent
plugin_build_path = plugin_path / 'build'

mkdir -p @(plugin_build_path)

for f in ['pluginrc.sh', 'vimrc']:
    file = plugin_path/f
    if file.exists():
        cp @(file) @(plugin_build_path)
    else:
        print(f'File not found: {file}')
        exit(1)
