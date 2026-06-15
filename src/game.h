/* Estructuras y constantes principales de BitQuest */
#ifndef GAME_H
#define GAME_H

#define MAPA_ANCHO   60     
#define MAPA_ALTO    60     
#define VENTANA      20     
#define MAX_NIVELES  3      

#define T_PARED   '#'
#define T_PISO    '.'
#define T_MONEDA  'o'
#define T_LLAVE   'K'
#define T_PUERTA  'D'
#define T_SALIDA  'E'
#define T_JUGADOR '@'

typedef struct {
    char mapa[MAPA_ALTO * MAPA_ANCHO]; 
    int  px, py;            
    int  monedas;           
    int  monedas_total;     
    int  tiene_llave;       
    int  nivel;             
    int  terminado;         
    int  pasos;             
} Juego;

int  juego_cargar_nivel(Juego *j, int nivel);
void juego_mover(Juego *j, int dx, int dy);
int  juego_ganado(const Juego *j);

#endif 
