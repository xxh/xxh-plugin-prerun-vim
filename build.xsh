#!/usr/bin/env xonsh

from sys import exit

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
