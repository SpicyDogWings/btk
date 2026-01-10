#!/bin/bash

# see colors: https://robotmoon.com/256-colors/

# Aviso: Para checkar todos los colores
for i in {0..255}; do
    tput setab $i
    printf "  "
    tput sgr0
done
