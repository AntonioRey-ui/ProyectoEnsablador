#ifndef RENDER_H
#define RENDER_H

#include "game.h"

void render_init(void);              /* prepara la consola (VT en Windows) */
void render_limpiar(void);           
void render_juego(const Juego *j);   /* dibuja ventana 20x20 + HUD */
void render_mensaje_final(const Juego *j);

#endif