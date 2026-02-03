#!/bin/bash

# Script de prueba para la funcionalidad de formato printf

# Cargar el toolkit
source ./btk.sh

echo "=== Pruebas de formato printf (v2.1) ==="
echo

echo "1. Prueba básica sin formato (compatibilidad hacia atrás):"
bgBlue "Texto simple sin formato"
echo
echo "2. Prueba con un placeholder %s:"
bgBlue "Pod de %s" "nginx-123"
echo
echo "3. Prueba con múltiples placeholders:"
bgBlue "Pod %s tiene %d réplicas y estado %s" "nginx-123" 3 "running"
echo
echo "4. Prueba con función bold y formato:"
bold "Hola %s, bienvenido al sistema" "Juan"
echo
echo "5. Prueba con función red y formato numérico:"
red "Error %d: %s" 404 "Página no encontrada"
echo
echo "6. Prueba con log_info y formato:"
log_info "Servicio %s iniciado en puerto %d" "nginx" 8080
echo
echo "7. Prueba con custom_color y formato:"
custom_color "WHITE" "BLUE" "Usuario %s tiene %d mensajes nuevos" "juan" 5
echo
echo "8. Prueba con función green y formato decimal:"
green "Temperatura: %.1f°C" 23.5
echo
echo "9. Prueba con bgLightBlue y formato complejo:"
bgLightBlue "Cluster: %s | Nodos: %d | Estado: %s" "produccion" 5 "activo"
echo
echo "10. Prueba con underline y formato:"
underline "Archivo %s modificado el %s" "config.yaml" "2023-11-15"
echo

echo "11. Pruebas de compatibilidad hacia atrás (sin argumentos adicionales):"
bgBlue "Texto simple sin formato"
red "Texto rojo simple"
bold "Texto negrita simple"
echo

echo "12. Pruebas de formato con múltiples tipos de datos:"
bgLightBlue "Entero: %d, Float: %.2f, String: %s" 42 3.14159 "test"
echo

echo "13. Pruebas de formato con alineación:"
bgGreen "|%10s|%-10s|%10d|" "derecha" "izquierda" 123
echo

echo "14. Pruebas de formato con relleno:"
bgYellow "|%05d|%05d|" 42 12345
echo

echo "15. Pruebas de formato con precisión:"
bgCyan "Pi: %.5f, Porcentaje: %.1f%%" 3.14159265 98.7
echo

echo "16. Pruebas de formato con caracteres especiales:"
bgMagenta "Ruta: %s, Puerto: %d, Estado: %s" "/home/user" 8080 "activo"
echo

echo "17. Pruebas de formato con variables:"
USER="juan"
COUNT=100
PERCENT=85.5
bgLightGreen "Usuario: %s, Count: %d, Percent: %.1f%%" "$USER" "$COUNT" "$PERCENT"
echo

echo "18. Pruebas de formato con expresiones:"
bgWhite "Resultado: %d, Promedio: %.2f" $((5 + 3)) $(echo "scale=2; 15/7" | bc)
echo

echo "=== Fin de pruebas ==="