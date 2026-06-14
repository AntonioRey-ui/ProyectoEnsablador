#ifndef INPUT_H
#define INPUT_H

enum {
    TECLA_ARRIBA = 1,
    TECLA_ABAJO,
    TECLA_IZQ,
    TECLA_DER,
    TECLA_SALIR,
    TECLA_OTRA
};

void input_init(void);   /* activa modo "raw" (solo Unix) */
void input_fin(void);    /* restaura la terminal (solo Unix) */
int  input_leer(void);   /* lee una tecla y la traduce a TECLA_* */

#endif