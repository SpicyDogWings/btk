#!/bin/bash

# Script de prueba para la funcionalidad de formato printf

# Cargar el toolkit
source ./btk.sh

echo "=== Pruebas de formato printf ==="
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
echo "=== Fin de pruebas ==="