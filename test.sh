#!/bin/bash

# Test script para BTK (Bash ToolKit) refactorizado
# Este script demuestra todas las funcionalidades del nuevo sistema

# Cargar el toolkit
source ./btk.sh

echo "=========================================="
echo "BTK - Bash ToolKit v2.1 - Test Suite (Con soporte printf)"
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

# Test 4b: Funciones de logging con formato printf
echo "4b. Testing logging functions with printf format:"
log_info "Service %s started on port %d" "nginx" 8080
log_success "Task %s completed in %d seconds" "backup" 120
log_warn "Warning: %s usage is %d%%" "CPU" 95
log_error "Error %d: %s" 404 "Page not found"
log_debug "Debug: variable %s = %s" "status" "running"
echo

# Test 5: Funciones rápidas de logging
echo "5. Testing quick logging functions:"
log_info "Quick info message"
log_warn "Quick warning"
log_error "Quick error"
log_success "Quick success"
log_debug "Quick debug"
echo

# Test 5b: Funciones rápidas de logging con formato printf
echo "5b. Testing quick logging functions with printf format:"
log_info "User %s logged in from %s" "juan" "192.168.1.100"
log_warn "Disk %s is %d%% full" "/dev/sda1" 85
log_error "Connection to %s failed: %s" "database" "timeout"
log_success "File %s transferred: %d bytes" "data.txt" 1024
log_debug "Function %s executed in %.2f seconds" "process_data" 2.45
echo

# Test 6: Función custom_color
echo "6. Testing custom_color function:"
custom_color "WHITE" "BLUE" " White on Blue "
custom_color "BLACK" "LIGHT_GREEN" " Black on Light Green "
custom_color "RED" "YELLOW" " Red on Yellow "
echo

# Test 6b: Función custom_color con formato printf
echo "6b. Testing custom_color function with printf format:"
custom_color "WHITE" "BLUE" "User %s has %d messages" "juan" 5
custom_color "RED" "YELLOW" "Alert: %s - Level %d" "High CPU" 3
custom_color "BLACK" "LIGHT_GREEN" "Status: %s (%d%%)" "Running" 100
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

# Test 16: Pruebas completas de formato printf
echo "16. Testing comprehensive printf format support:"
echo "   String formatting: $(red "Name: %s" "Juan")"
echo "   Decimal formatting: $(green "Count: %d" 42)"
echo "   Float formatting: $(blue "Temperature: %.1f°C" 23.5)"
echo "   Multiple args: $(bgBlue "Pod %s: %d replicas, status %s" "nginx-123" 3 "running")"
echo "   Mixed types: $(bgGreen "User %s (ID: %d) has %.2f credits" "juan" 1001 15.75)"
echo "   Percentage: $(bgYellow "CPU usage: %d%%" 85)"
echo "   Complex nested: $(bgLightBlue $(bold $(white "Server %s: %d%% CPU, %d%% RAM") "web-01" 75 60))"
echo

echo "=========================================="
echo "BTK Test Suite Completed!"
echo "=========================================="
