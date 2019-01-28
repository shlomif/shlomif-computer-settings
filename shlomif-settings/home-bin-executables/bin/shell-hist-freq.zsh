#! /usr/bin/env zsh
h()
{
    history 1 -1 | perl -lanE 'say $F[1]' | sus
}
