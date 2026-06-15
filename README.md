# BitQuest

Videojuego de consola que recorre un mapa tipo matriz de 60×60 a traves de
una ventana que se ve de 20×20. El jugador recoge monedas, busca una
llave para abrir una puerta y llega a la salida para avanzar de
nivel. 
Varias funciones del juego estan implementadas en ensamblador NASM de
64 bits.

## Como jugar

| Tecla            | Acción            |
|------------------|-------------------|
|  W  /  ↑         | mover arriba      |
|  S  /  ↓         | mover abajo       |
|  A  /  ←         | mover izquierda   |
|  D  /  →         | mover derecha     |
|  Q               | Salir             |

### Símbolos en pantalla:
`@` jugador
`#` pared
`o` moneda
`K` llave
`D` puerta
`E` salida.

## Estructura del proyecto


ProyectoEnsamblador/
├── src/                  Código C
│   ├── main.c            Bucle principal
│   ├── game.c/.h         Carga de mapas, movimiento y reglas
│   ├── render.c/.h       ventana 20×20
│   ├── input.c/.h        Lectura de teclado
│   └── asm_funcs.h       funciones en ensamblador
├── asm/  
│   └── funciones.asm     Funciones en NASM
├── maps/                 Mapas de los niveles
├── build.bat             Compilación en Windows
├── Makefile              Compilación en macOS / Linux
└── README.md             Manueal


## Funciones implementadas en NASM - asm/funciones.asm

| Funcion       | Descripcion                                              |
|---------------|----------------------------------------------------------|
|  asm_contar   | Cuenta las monedas en el mapa.                           |
|  asm_celda    | Devuelve el caracter del mapa en una coordenada x,y.     |
|  asm_indice   | Calcula el indice lineal.                                |
|  asm_clamp    | Limita la camara a los bordes del mapa.                  |

El mismo archivo .asm se ensambla en Windows win64 y en macOS/Linux
macho64/`elf64, detecta la convencion de llamada automaticamente con la
macro OUTPUT_FORMAT de NASM.

## Compilacion y ejecucion

### Windows

Requisitos: NASM y GCC de 64 bits en el PATH.

build.bat
build.bat run
build.bat clean


### macOS / Linux

Requisitos: NASM y clang. En macOS: brew install nasm.

make
make run
make clean