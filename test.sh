#!/bin/bash

# Test script para BTK (Bash ToolKit) refactorizado
# Este script demuestra todas las funcionalidades del nuevo sistema

# Cargar el toolkit
source ./btk.sh

echo "=========================================="
echo "BTK - Bash ToolKit v2.0 - Test Suite"
echo "=========================================="
echo

# Test 1: Funciones básicas de color
echo "1. Testing color functions:"
echo "   $(red 'Red text') | $(green 'Green text') | $(blue 'Blue text')"
echo "   $(yellow 'Yellow text') | $(magenta 'Magenta text') | $(cyan 'Cyan text')"
echo "   $(lightRed 'Light Red') | $(lightGreen 'Light Green') | $(lightBlue 'Light Blue')"
echo

# Test 2: Funciones de fondo
echo "2. Testing background functions:"
echo "   $(bgBlue 'Blue background') | $(bgGreen 'Green background') | $(bgRed 'Red background')"
echo "   $(bgYellow 'Yellow background') | $(bgLightBlack 'Light Black background')"
echo

# Test 3: Funciones de estilo
echo "3. Testing style functions:"
echo "   $(bold 'Bold text') | $(underline 'Underlined text') | $(blink 'Blinking text')"
echo

# Test 4: Funciones de logging
echo "4. Testing logging functions:"
log_info "This is an informational message"
log_success "Operation completed successfully!"
log_warn "This is a warning message"
log_error "This is an error message"
log_debug "Debug information for developers"
echo

# Test 5: Funciones rápidas de logging
echo "5. Testing quick logging functions:"
log_info "Quick info message"
log_warn "Quick warning"
log_error "Quick error"
log_success "Quick success"
log_debug "Quick debug"
echo

# Test 6: Función custom_color
echo "6. Testing custom_color function:"
custom_color "WHITE" "BLUE" " White on Blue "
custom_color "BLACK" "LIGHT_GREEN" " Black on Light Green "
custom_color "RED" "YELLOW" " Red on Yellow "
echo

# Test 7: Combinaciones complejas
echo "7. Testing complex combinations:"
echo "   $(bold $(red 'Bold Red')) | $(underline $(green 'Underlined Green'))"
echo "   $(bgBlue $(white 'White on Blue')) | $(bgRed $(yellow 'Yellow on Red'))"
echo

# Test 8: Manejo de múltiples palabras
echo "8. Testing multi-word handling:"
echo "   $(red 'This is a red sentence with multiple words')"
echo "   $(bgBlue 'This background spans multiple words correctly')"
echo

# Test 9: Multicolor en texto (combinaciones avanzadas)
echo "9. Testing multicolor text combinations:"
echo "   $(red 'Red') $(green 'Green') $(blue 'Blue') - Multiple colors in one line"
echo "   $(bgBlue $(red 'Red on Blue')) | $(bgGreen $(white 'White on Green')) - Nested colors"
echo "   $(bold $(underline $(red 'Bold Underlined Red'))) - Multiple styles combined"
echo

# Test 10: Multicolor en fondos
echo "10. Testing multicolor background combinations:"
echo "   $(bgBlue 'Blue BG') $(bgGreen 'Green BG') $(bgRed 'Red BG') - Multiple backgrounds"
echo "   $(bgLightBlack $(white 'Light Black BG')) | $(bgLightBlue $(black 'Light Blue BG')) - Light backgrounds"
echo

# Test 11: Sistema de temas
echo "11. Testing theme system:"
echo "   Current theme text color: ${THEME[TEXT_COLOR]}SAMPLE${STYLES[NONE]}"
echo "   Info color: ${THEME[INFO_COLOR]}SAMPLE${STYLES[NONE]}"
echo "   Warn color: ${THEME[WARN_COLOR]}SAMPLE${STYLES[NONE]}"
echo "   Error color: ${THEME[ERROR_COLOR]}SAMPLE${STYLES[NONE]}"
echo

# Test 12: Cambio de tema dinámico
echo "12. Testing dynamic theme change:"
echo "   Original theme:"
log_info "Message with original theme"

# Cambiar a tema personalizado
set_theme "${FG_COLORS[BLACK]}" "${BG_COLORS[LIGHT_CYAN]}" "${BG_COLORS[LIGHT_MAGENTA]}" "${BG_COLORS[LIGHT_RED]}" "${BG_COLORS[LIGHT_GREEN]}" "${BG_COLORS[LIGHT_YELLOW]}"

echo "   Custom theme:"
log_info "Message with custom theme"
log_warn "Warning with custom theme"
log_error "Error with custom theme"
echo

# Test 13: Modo claro/oscuro
echo "13. Testing light/dark mode:"
echo "   Current MODE: $MODE"
echo "   Text color in current mode: ${THEME[TEXT_COLOR]}SAMPLE${STYLES[NONE]}"
echo

# Test 14: Manejo de errores
echo "14. Testing error handling:"
echo "   Testing log without message:"
log "info"  # Esto debería mostrar un error
echo

# Test 15: Multicolor avanzado - Gradientes y patrones
echo "15. Testing advanced multicolor patterns:"
echo "   $(red 'R')$(green 'G')$(blue 'B') - Rainbow effect"
echo "   $(bgRed ' R ')$(bgGreen ' G ')$(bgBlue ' B ') - Background rainbow"
echo "   $(bold $(red 'B')$(green 'o')$(blue 'l')$(magenta 'd') $(cyan 'R')$(yellow 'a')$(white 'i')$(lightRed 'n')$(lightGreen 'b')$(lightBlue 'o')$(lightMagenta 'w'))"
echo

echo "=========================================="
echo "BTK Test Suite Completed!"
echo "=========================================="
