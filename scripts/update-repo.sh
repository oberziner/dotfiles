#!/usr/bin/env bash

expectedRepoAddress="https://github.com/oberziner/dotfiles.git"
actualRepoAddress=$(git remote -v show 2>&1 | grep fetch | cut -f2 | cut -f1 -d " ")
if [ ! -d ".git" ]; then
    echo "Not a Git Repo. This script must be executed from Git repo root"
    exit 1;

fi

if [ $expectedRepoAddress != $actualRepoAddress ]; then
    echo "Wrong Git repository. Should be $expectedRepoAddress"
    exit 1;
fi

echo "Copying files"
cp -v ~/.bash_profile .bash_profile
cp -v ~/.bashrc .bashrc
cp -v ~/.vimrc .vimrc
cp -v ~/.xinitrc .xinitrc
cp -v ~/.Xresources .Xresources
