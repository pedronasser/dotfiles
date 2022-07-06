#!/bin/bash

languages=`echo $CHT_SH_LANGUAGES | tr ' ' '\n'`

selected=`printf "$languages" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`
curl -s cht.sh/$selected/$query

while [ : ]; do sleep 1; done
