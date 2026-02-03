# Bash Tool Kit (BTK)

**Versión 2.0 (Refactored)** - Sistema avanzado de colores y logging para scripts bash

Este es un conjunto de herramientas para facilitar el uso de bash en un solo archivo, proporcionando un sistema completo de logging con colores, estilos de texto y personalización de temas.


## Instalación

1. Instalar btk descargando el script .sh del repo, la última versión estable.
``` bash
curl -L -o btk.sh https://github.com/SpicyDogWings/btk/releases/download/$RELEASE_VERSION/btk.sh
```
Luego hacer la importación en el script de automatización que vayas a hacer.
``` bash
source ./btk.sh
```


## Funcionalidades

El script `btk.sh` proporciona las siguientes funcionalidades:

### Funciones de Logging
- `log "info" "mensaje"`: Muestra un mensaje de información con fondo azul
- `log "warn" "mensaje"`: Muestra un mensaje de advertencia con fondo amarillo  
- `log "error" "mensaje"`: Muestra un mensaje de error con fondo rojo
- `log "success" "mensaje"`: Muestra un mensaje de éxito con fondo verde
- `log "debug" "mensaje"`: Muestra un mensaje de depuración con fondo gris oscuro
- `log_info "mensaje"`: Atajo para log de información
- `log_warn "mensaje"`: Atajo para log de advertencia
- `log_error "mensaje"`: Atajo para log de error
- `log_success "mensaje"`: Atajo para log de éxito
- `log_debug "mensaje"`: Atajo para log de depuración

### Funciones de Color de Texto
- `black "texto"`, `red "texto"`, `green "texto"`, `yellow "texto"`, `blue "texto"`, `magenta "texto"`, `cyan "texto"`, `white "texto"`: Muestra texto en el color especificado
- `lightBlack "texto"`, `lightRed "texto"`, `lightGreen "texto"`, `lightYellow "texto"`, `lightBlue "texto"`, `lightMagenta "texto"`, `lightCyan "texto"`, `lightWhite "texto"`: Muestra texto en el color claro especificado

### Funciones de Color de Fondo
- `bgBlack "texto"`, `bgRed "texto"`, `bgGreen "texto"`, `bgYellow "texto"`, `bgBlue "texto"`, `bgMagenta "texto"`, `bgCyan "texto"`, `bgWhite "texto"`: Muestra texto con el fondo del color especificado
- `bgLightBlack "texto"`, `bgLightRed "texto"`, `bgLightGreen "texto"`, `bgLightYellow "texto"`, `bgLightBlue "texto"`, `bgLightMagenta "texto"`, `bgLightCyan "texto"`, `bgLightWhite "texto"`: Muestra texto con el fondo del color claro especificado

### Funciones de Estilo
- `bold "texto"`: Muestra texto en negrita
- `underline "texto"`: Muestra texto subrayado
- `blink "texto"`: Muestra texto parpadeante

### Funciones Avanzadas
- `custom_color "FG_COLOR" "BG_COLOR" "texto"`: Crea combinaciones personalizadas de colores
- `set_theme "text_color" "info_color" "warn_color" "error_color" "success_color" "debug_color"`: Cambia el tema dinámicamente

## Configuración

### Variables de Configuración
- `MODE`: Variable para cambiar entre modo claro (`"light"`) y oscuro (`"dark"`). Por defecto está en modo claro.
- `TEXT_COLOR`: Color del texto por defecto (blanco en modo oscuro, negro en modo claro)
- `INFO_COLOR`: Color de fondo para mensajes de información (azul)
- `WARN_COLOR`: Color de fondo para mensajes de advertencia (amarillo)
- `ERROR_COLOR`: Color de fondo para mensajes de error (rojo)
- `SUCCESS_COLOR`: Color de fondo para mensajes de éxito (verde)
- `DEBUG_COLOR`: Color de fondo para mensajes de depuración (gris oscuro)

### Arrays Asociativos
El script utiliza arrays asociativos para una gestión eficiente de colores y estilos:
- `FG_COLORS`: Colores de texto (foreground)
- `BG_COLORS`: Colores de fondo (background)
- `STYLES`: Estilos de texto (negrita, subrayado, etc.)
- `THEME`: Configuración del tema actual


## Colores
### Referencias
Referencias de los colores y estilos en bash:
[robotmoon](https://robotmoon.com/256-colors/)


## Ejemplo de Uso

Aquí tienes un ejemplo completo de cómo usar las funciones de `btk.sh` en tu script:

```bash
#!/bin/bash

# Importar el script btk
source ./btk.sh

# Configuración (opcional)
MODE="dark"  # Cambiar a modo oscuro

# Ejemplo de uso de funciones de log
log_info "Este es un mensaje informativo"
log_warn "Este es un mensaje de advertencia"
log_error "Este es un mensaje de error"
log_success "Operación completada con éxito"
log_debug "Depuración: valor de variable = $valor"

# Ejemplo de uso de colores de texto
echo "$(red 'Texto rojo')"
echo "$(green 'Texto verde')"
echo "$(blue 'Texto azul')"
echo "$(lightRed 'Texto rojo claro')"
echo "$(lightGreen 'Texto verde claro')"

# Ejemplo de uso de colores de fondo
echo "$(bgRed 'Fondo rojo')"
echo "$(bgGreen 'Fondo verde')"
echo "$(bgBlue 'Fondo azul')"
echo "$(bgLightRed 'Fondo rojo claro')"
echo "$(bgLightGreen 'Fondo verde claro')"

# Ejemplo de uso de estilos
echo "$(bold 'Texto en negrita')"
echo "$(underline 'Texto subrayado')"
echo "$(blink 'Texto parpadeante')"

# Combinación de colores y estilos
echo "$(bgYellow $(bold $(black 'Fondo amarillo con texto negro en negrita')))"
echo "$(bgLightBlue $(lightWhite 'Fondo azul claro con texto blanco claro'))"

# Funciones avanzadas
echo "$(custom_color "WHITE" "BLUE" "Texto personalizado: blanco sobre azul")"

# Cambiar tema dinámicamente
set_theme "${FG_COLORS[BLACK]}" "${BG_COLORS[CYAN]}" "${BG_COLORS[RED]}" "${BG_COLORS[MAGENTA]}" "${BG_COLORS[YELLOW]}" "${BG_COLORS[LIGHT_BLACK]}"
log_info "Este mensaje usa el nuevo tema"
```

Este ejemplo muestra cómo:
1. Importar el script `btk.sh`
2. Configurar el modo (opcional)
3. Usar las funciones de log para mensajes estandarizados con diferentes niveles
4. Aplicar colores de texto (normales y claros)
5. Aplicar colores de fondo (normales y claros)
6. Usar estilos de texto (negrita, subrayado, parpadeante)
7. Combinar colores de fondo, texto y estilos
8. Usar funciones avanzadas como `custom_color` y `set_theme`


## Requisitos

El script requiere que `tput` esté instalado en el sistema para funcionar correctamente. La mayoría de los sistemas Unix/Linux lo incluyen por defecto.


## Notas

- Todas las funciones devuelven el texto formateado, por lo que se pueden anidar y combinar fácilmente
- El script está optimizado para usar arrays asociativos, lo que mejora el rendimiento y la legibilidad
- Los colores se basan en la paleta estándar de 16 colores de terminal
