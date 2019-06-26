#!/usr/bin/env bash

for f in ~/.vim/bundle/*
do
    cd $f
    if [ -d ".git" ]; then
        git rev-parse HEAD | tr "\n" " "
        git remote -v show | grep fetch | cut -f2 | cut -f1 -d " "
    else
        echo "$f is not a Git repo"
    fi
done
