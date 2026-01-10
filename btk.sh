#!/bin/bash
# see colors: https://robotmoon.com/256-colors/

BLUE=$(tput setaf 4)
NONE=$(tput sgr0)

function log () {
    DATE_COLOR=$BLUE
    printf "${DATE_COLOR}$(date)${NONE} $1\n"
}

log hola
