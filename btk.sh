#!/bin/bash

# Configuración
MODE="light"

# Colores básicos
BLACK=$(tput setaf 0)           # Negro
RED=$(tput setaf 1)             # Rojo
GREEN=$(tput setaf 2)           # Verde
YELLOW=$(tput setaf 3)          # Amarillo
BLUE=$(tput setaf 4)            # Azul
MAGENTA=$(tput setaf 5)         # Magenta
CYAN=$(tput setaf 6)            # Cyan
WHITE=$(tput setaf 7)           # Blanco
LIGHT_BLACK=$(tput setaf 8)     # Azul claro
LIGHT_RED=$(tput setaf 9)       # Rojo claro
LIGHT_GREEN=$(tput setaf 10)    # Verde claro
LIGHT_YELLOW=$(tput setaf 11)   # Amarillo claro
LIGHT_BLUE=$(tput setaf 12)     # Azul claro
LIGHT_MAGENTA=$(tput setaf 13)  # Magenta
LIGHT_CYAN=$(tput setaf 14)     # Cyan
LIGHT_WHITE=$(tput setaf 15)    # Blanco

# Colores de fondo
BG_BLACK=$(tput setab 0)            # Fondo negro
BG_RED=$(tput setab 1)              # Fondo rojo
BG_GREEN=$(tput setab 2)            # Fondo verde
BG_YELLOW=$(tput setab 3)           # Fondo amarillo
BG_BLUE=$(tput setab 4)             # Fondo azul
BG_MAGENTA=$(tput setab 5)          # Fondo magenta
BG_CYAN=$(tput setab 6)             # Fondo cyan
BG_WHITE=$(tput setab 7)            # Fondo blanco
BG_LIGHT_BLACK=$(tput setab 8)      # Fondo negro claro
BG_LIGHT_RED=$(tput setab 9)        # Fondo rojo claro
BG_LIGHT_GREEN=$(tput setab 10)     # Fondo verde claro
BG_LIGHT_YELLOW=$(tput setab 11)    # Fondo amarillo claro
BG_LIGHT_BLUE=$(tput setab 12)      # Fondo azul claro
BG_LIGHT_MAGENTA=$(tput setab 13)   # Fondo magenta claro
BG_LIGHT_CYAN=$(tput setab 14)      # Fondo cyan claro
BG_LIGHT_WHITE=$(tput setab 15)     # Fondo blanco claro

# Vaiaciones
NONE=$(tput sgr0)                   # Resetear color
BOLD=$(tput bold)                   # Texto en bold
BOLD=$(tput smul)                   # Texto en underline
BOLD=$(tput blink)                  # Texto en blick

# preset
TEXT_COLOR=$BLACK
INFO_COLOR=$BG_BLUE
WARN_COLOR=$BG_YELLOW
ERROR_COLOR=$BG_RED

# Logs
function log () {
    if [ $MODE = "black" ]; then
        TEXT_COLOR=$WHITE
    fi
    DATE_COLOR=$NONE
    case "$1" in
        "info")
            BG_COLOR=$INFO_COLOR
            LOG_TYPE="INFO"
            ;;
        "warn")
            BG_COLOR=$WARN_COLOR
            LOG_TYPE="WARNING"
            ;;
        "error")
            BG_COLOR=$ERROR_COLOR
            LOG_TYPE="ERROR"
            ;;
        *)
            BG_COLOR=$NONE
            ;;
    esac
    printf "$(date) ${TYPE_COLOR}${BG_COLOR}${TEXT_COLOR} ${LOG_TYPE} ${NONE} $2\n"
}

# Logs
function pprint () {
    TEXT_COLOR=$BLACK
    DATE_COLOR=$NONE
    case "$1" in
        "info")
            BG_COLOR=$INFO_COLOR
            LOG_TYPE="INFO"
            ;;
        "warn")
            BG_COLOR=$WARN_COLOR
            LOG_TYPE="WARNING"
            ;;
        "error")
            BG_COLOR=$ERROR_COLOR
            LOG_TYPE="ERROR"
            ;;
        *)
            BG_COLOR=$NONE
            ;;
    esac
    printf "$(date) ${TYPE_COLOR}${BG_COLOR}${TEXT_COLOR} ${LOG_TYPE} ${NONE} $2\n"
}

log info code
log warn code
log error code
