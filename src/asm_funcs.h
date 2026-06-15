/* funciones obligatorias */
#ifndef ASM_FUNCS_H
#define ASM_FUNCS_H

long asm_contar(const char *buf, long len, char objetivo);


char asm_celda(const char *mapa, int ancho, int x, int y);


int asm_indice(int ancho, int x, int y);


int asm_clamp(int valor, int min, int max);

#endif