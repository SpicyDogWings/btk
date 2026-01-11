# Bash Tool Kit

Este es un conjunto de herramientas para facilitar el uso de bash en un solo archivo.


## Instalación

1. Instalar btk descargando el script .sh del repo, la última versión estable.
``` bash
curl -O https://github.com/SpicyDogWings/btk/blob/main/btk.sh
```
Luego hacer la importación en el script de automatización que vayas a hacer.
``` bash
source ./btk.sh
```


## Funcionalidades

El script `btk.sh` proporciona las siguientes funcionalidades:

### Funciones de Log
- `log "info" "mensaje"`: Muestra un mensaje de información con fondo azul
- `log "warn" "mensaje"`: Muestra un mensaje de advertencia con fondo amarillo
- `log "error" "mensaje"`: Muestra un mensaje de error con fondo rojo

### Funciones de Color de Texto
- `black "texto"`: Muestra texto en color negro
- `red "texto"`: Muestra texto en color rojo
- `green "texto"`: Muestra texto en color verde
- `yellow "texto"`: Muestra texto en color amarillo
- `blue "texto"`: Muestra texto en color azul
- `magenta "texto"`: Muestra texto en color magenta
- `cyan "texto"`: Muestra texto en color cyan
- `white "texto"`: Muestra texto en color blanco
- `lightBlack "texto"`: Muestra texto en color negro claro
- `lightRed "texto"`: Muestra texto en color rojo claro
- `lightGreen "texto"`: Muestra texto en color verde claro
- `lightYellow "texto"`: Muestra texto en color amarillo claro
- `lightBlue "texto"`: Muestra texto en color azul claro
- `lightMagenta "texto"`: Muestra texto en color magenta claro
- `lightCyan "texto"`: Muestra texto en color cyan claro
- `lightWhite "texto"`: Muestra texto en color blanco claro

### Funciones de Color de Fondo
- `bgBlack "texto"`: Muestra texto con fondo negro
- `bgRed "texto"`: Muestra texto con fondo rojo
- `bgGreen "texto"`: Muestra texto con fondo verde
- `bgYellow "texto"`: Muestra texto con fondo amarillo
- `bgBlue "texto"`: Muestra texto con fondo azul
- `bgMagenta "texto"`: Muestra texto con fondo magenta
- `bgCyan "texto"`: Muestra texto con fondo cyan
- `bgWhite "texto"`: Muestra texto con fondo blanco
- `bgLightBlack "texto"`: Muestra texto con fondo negro claro
- `bgLightRed "texto"`: Muestra texto con fondo rojo claro
- `bgLightGreen "texto"`: Muestra texto con fondo verde claro
- `bgLightYellow "texto"`: Muestra texto con fondo amarillo claro
- `bgLightBlue "texto"`: Muestra texto con fondo azul claro
- `bgLightMagenta "texto"`: Muestra texto con fondo magenta claro
- `bgLightCyan "texto"`: Muestra texto con fondo cyan claro
- `bgLightWhite "texto"`: Muestra texto con fondo blanco claro

### Configuración
- `MODE`: Variable para cambiar entre modo claro (`"light"`) y oscuro (`"dark"`). Por defecto está en modo claro.
- `TEXT_COLOR`: Color del texto por defecto (blanco en modo oscuro, negro en modo claro)
- `INFO_COLOR`: Color de fondo para mensajes de información (azul)
- `WARN_COLOR`: Color de fondo para mensajes de advertencia (amarillo)
- `ERROR_COLOR`: Color de fondo para mensajes de error (rojo)


## Colores
### Referencias
Referencias de los colores y estilos en bash:
[robotmoon](https://robotmoon.com/256-colors/)


## Ejemplo de Uso

Aquí tienes un ejemplo de cómo usar las funciones de `btk.sh` en tu script:

```bash
#!/bin/bash

# Importar el script btk
source ./btk.sh

# Configuración (opcional)
MODE="dark"  # Cambiar a modo oscuro

# Ejemplo de uso de funciones de log
log "info" "Este es un mensaje informativo"
log "warn" "Este es un mensaje de advertencia"
log "error" "Este es un mensaje de error"

# Ejemplo de uso de colores de texto
echo "$(red 'Texto rojo')"
echo "$(green 'Texto verde')"
echo "$(blue 'Texto azul')"

# Ejemplo de uso de colores de fondo
echo "$(bgRed 'Fondo rojo')"
echo "$(bgGreen 'Fondo verde')"
echo "$(bgBlue 'Fondo azul')"

# Combinación de colores
echo "$(bgYellow $(black 'Fondo amarillo con texto negro'))"
echo "$(bgLightBlue $(white 'Fondo azul claro con texto blanco'))"
```

Este ejemplo muestra cómo:
1. Importar el script `btk.sh`
2. Configurar el modo (opcional)
3. Usar las funciones de log para mensajes estandarizados
4. Aplicar colores a texto
5. Aplicar colores de fondo
6. Combinar colores de fondo y texto
