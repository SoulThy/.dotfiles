#!/bin/bash

DOTFILES=dotfiles_linux

stow -R -v -t $HOME -d "$DOTFILES" .
