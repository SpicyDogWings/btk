#!/bin/bash

# BTK - Bash ToolKit
# Version: 2.0 (Refactored)
# Description: Advanced color and logging system for bash scripts

# Verificaciones
if ! command -v tput &> /dev/null; then
    echo "Error: 'tput' no está instalado. Este script requiere 'tput' para funcionar correctamente."
    exit 1
fi

# Configuración
# Usar MODE existente si está definido, sino usar "light" como valor por defecto
MODE="${MODE:-light}"

# ============================================
# CONFIGURACIÓN DE COLORES (Arrays Asociativos)
# ============================================

# Colores de texto (foreground)
declare -A FG_COLORS=(
    [BLACK]=$(tput setaf 0)
    [RED]=$(tput setaf 1)
    [GREEN]=$(tput setaf 2)
    [YELLOW]=$(tput setaf 3)
    [BLUE]=$(tput setaf 4)
    [MAGENTA]=$(tput setaf 5)
    [CYAN]=$(tput setaf 6)
    [WHITE]=$(tput setaf 7)
    [LIGHT_BLACK]=$(tput setaf 8)
    [LIGHT_RED]=$(tput setaf 9)
    [LIGHT_GREEN]=$(tput setaf 10)
    [LIGHT_YELLOW]=$(tput setaf 11)
    [LIGHT_BLUE]=$(tput setaf 12)
    [LIGHT_MAGENTA]=$(tput setaf 13)
    [LIGHT_CYAN]=$(tput setaf 14)
    [LIGHT_WHITE]=$(tput setaf 15)
)

# Colores de fondo (background)
declare -A BG_COLORS=(
    [BLACK]=$(tput setab 0)
    [RED]=$(tput setab 1)
    [GREEN]=$(tput setab 2)
    [YELLOW]=$(tput setab 3)
    [BLUE]=$(tput setab 4)
    [MAGENTA]=$(tput setab 5)
    [CYAN]=$(tput setab 6)
    [WHITE]=$(tput setab 7)
    [LIGHT_BLACK]=$(tput setab 8)
    [LIGHT_RED]=$(tput setab 9)
    [LIGHT_GREEN]=$(tput setab 10)
    [LIGHT_YELLOW]=$(tput setab 11)
    [LIGHT_BLUE]=$(tput setab 12)
    [LIGHT_MAGENTA]=$(tput setab 13)
    [LIGHT_CYAN]=$(tput setab 14)
    [LIGHT_WHITE]=$(tput setab 15)
)

# Estilos y controles
declare -A STYLES=(
    [NONE]=$(tput sgr0)
    [BOLD]=$(tput bold)
    [UNDERLINE]=$(tput smul)
    [BLINK]=$(tput blink)
)

# ============================================
# CONFIGURACIÓN DE TEMA
# ============================================

# Configuración por defecto
declare -A THEME=(
    [TEXT_COLOR]="${FG_COLORS[WHITE]}"
    [INFO_COLOR]="${BG_COLORS[BLUE]}"
    [WARN_COLOR]="${BG_COLORS[YELLOW]}"
    [ERROR_COLOR]="${BG_COLORS[RED]}"
    [SUCCESS_COLOR]="${BG_COLORS[GREEN]}"
    [DEBUG_COLOR]="${BG_COLORS[LIGHT_BLACK]}"
)

# Aplicar modo claro/oscuro
if [ "$MODE" = "light" ]; then
    THEME[TEXT_COLOR]="${FG_COLORS[BLACK]}"
else
    THEME[TEXT_COLOR]="${FG_COLORS[WHITE]}"
fi



# ============================================
# FUNCIONES DE LOGGING
# ============================================

# Función principal de logging
# Uso: log <tipo> <mensaje>
# Tipos: info, warn, error, success, debug
function log() {
    local type="${1:-info}"  # Tipo de log (por defecto: info)
    local message="${2:-}"    # Mensaje a mostrar
    local bg_color="${STYLES[NONE]}"
    local text_color="${THEME[TEXT_COLOR]}"
    local log_type="INFO"

    # Validar que se proporcione un mensaje
    if [ -z "$message" ]; then
        echo "Error: log() requiere un mensaje como segundo parámetro" >&2
        return 1
    fi

    case "$type" in
        "info")
            bg_color="${THEME[INFO_COLOR]}"
            log_type="INFO"
            ;;
        "warn")
            bg_color="${THEME[WARN_COLOR]}"
            log_type="WARNING"
            ;;
        "error")
            bg_color="${THEME[ERROR_COLOR]}"
            log_type="ERROR"
            ;;
        "success")
            bg_color="${THEME[SUCCESS_COLOR]}"
            log_type="SUCCESS"
            ;;
        "debug")
            bg_color="${THEME[DEBUG_COLOR]}"
            text_color="${FG_COLORS[BLACK]}"
            log_type="DEBUG"
            ;;
        *)
            bg_color="${STYLES[NONE]}"
            log_type="${type^^}"  # Convertir a mayúsculas
            ;;
    esac

    # Formato: [FECHA] [TIPO] mensaje
    printf "%s %s%s%s %s %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$bg_color$text_color" "[$log_type]" "${STYLES[NONE]}" "$message"
}

# Funciones de logging rápidas
function log_info() { log "info" "$*"; }
function log_warn() { log "warn" "$*"; }
function log_error() { log "error" "$*"; }
function log_success() { log "success" "$*"; }
function log_debug() { log "debug" "$*"; }


# ============================================
# FUNCIONES DE COLOR
# ============================================

# Funciones de color de texto
# Uso: <color> "texto"
# Ejemplo: red "Este texto será rojo"
function black() { printf "${FG_COLORS[BLACK]}%s${STYLES[NONE]}" "$*"; }
function red() { printf "${FG_COLORS[RED]}%s${STYLES[NONE]}" "$*"; }
function green() { printf "${FG_COLORS[GREEN]}%s${STYLES[NONE]}" "$*"; }
function yellow() { printf "${FG_COLORS[YELLOW]}%s${STYLES[NONE]}" "$*"; }
function blue() { printf "${FG_COLORS[BLUE]}%s${STYLES[NONE]}" "$*"; }
function magenta() { printf "${FG_COLORS[MAGENTA]}%s${STYLES[NONE]}" "$*"; }
function cyan() { printf "${FG_COLORS[CYAN]}%s${STYLES[NONE]}" "$*"; }
function white() { printf "${FG_COLORS[WHITE]}%s${STYLES[NONE]}" "$*"; }
function lightBlack() { printf "${FG_COLORS[LIGHT_BLACK]}%s${STYLES[NONE]}" "$*"; }
function lightRed() { printf "${FG_COLORS[LIGHT_RED]}%s${STYLES[NONE]}" "$*"; }
function lightGreen() { printf "${FG_COLORS[LIGHT_GREEN]}%s${STYLES[NONE]}" "$*"; }
function lightYellow() { printf "${FG_COLORS[LIGHT_YELLOW]}%s${STYLES[NONE]}" "$*"; }
function lightBlue() { printf "${FG_COLORS[LIGHT_BLUE]}%s${STYLES[NONE]}" "$*"; }
function lightMagenta() { printf "${FG_COLORS[LIGHT_MAGENTA]}%s${STYLES[NONE]}" "$*"; }
function lightCyan() { printf "${FG_COLORS[LIGHT_CYAN]}%s${STYLES[NONE]}" "$*"; }
function lightWhite() { printf "${FG_COLORS[LIGHT_WHITE]}%s${STYLES[NONE]}" "$*"; }

# Funciones de color de fondo
# Uso: bg<color> "texto"
# Ejemplo: bgBlue "Este texto tendrá fondo azul"
function bgBlack() { printf "${BG_COLORS[BLACK]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgRed() { printf "${BG_COLORS[RED]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgGreen() { printf "${BG_COLORS[GREEN]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgYellow() { printf "${BG_COLORS[YELLOW]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgBlue() { printf "${BG_COLORS[BLUE]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgMagenta() { printf "${BG_COLORS[MAGENTA]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgCyan() { printf "${BG_COLORS[CYAN]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgWhite() { printf "${BG_COLORS[WHITE]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightBlack() { printf "${BG_COLORS[LIGHT_BLACK]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightRed() { printf "${BG_COLORS[LIGHT_RED]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightGreen() { printf "${BG_COLORS[LIGHT_GREEN]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightYellow() { printf "${BG_COLORS[LIGHT_YELLOW]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightBlue() { printf "${BG_COLORS[LIGHT_BLUE]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightMagenta() { printf "${BG_COLORS[LIGHT_MAGENTA]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightCyan() { printf "${BG_COLORS[LIGHT_CYAN]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }
function bgLightWhite() { printf "${BG_COLORS[LIGHT_WHITE]}${THEME[TEXT_COLOR]}%s${STYLES[NONE]}" "$*"; }

# ============================================
# FUNCIONES DE ESTILO
# ============================================

# Funciones de estilo de texto
function bold() { printf "${STYLES[BOLD]}%s${STYLES[NONE]}" "$*"; }
function underline() { printf "${STYLES[UNDERLINE]}%s${STYLES[NONE]}" "$*"; }
function blink() { printf "${STYLES[BLINK]}%s${STYLES[NONE]}" "$*"; }

# ============================================
# FUNCIONES AVANZADAS
# ============================================

# Función para crear combinaciones personalizadas
# Uso: custom_color <fg_color> <bg_color> "texto"
function custom_color() {
    local fg="${FG_COLORS[$1]:-${THEME[TEXT_COLOR]}}"
    local bg="${BG_COLORS[$2]:-${STYLES[NONE]}}"
    printf "%s%s%s%s" "$bg" "$fg" "$3" "${STYLES[NONE]}"
}

# Función para cambiar el tema dinámicamente
# Uso: set_theme <text_color> <info_color> <warn_color> <error_color> <success_color> <debug_color>
function set_theme() {
    THEME[TEXT_COLOR]="$1"
    THEME[INFO_COLOR]="$2"
    THEME[WARN_COLOR]="$3"
    THEME[ERROR_COLOR]="$4"
    THEME[SUCCESS_COLOR]="$5"
    THEME[DEBUG_COLOR]="$6"
}

# ============================================
# DOCUMENTACIÓN Y EJEMPLOS
# ============================================

# Ejemplos de uso:
# log_info "Este es un mensaje informativo"
# log_error "¡Algo salió mal!"
# red "Texto en rojo"
# bgBlue "Texto con fondo azul"
# bold "Texto en negrita"
# custom_color "WHITE" "BLUE" "Texto personalizado"

