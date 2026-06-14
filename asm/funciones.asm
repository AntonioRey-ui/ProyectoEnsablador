%ifidn __OUTPUT_FORMAT__, win64
    %define ARG1 rcx          ; primer  argumento
    %define ARG2 rdx          ; segundo argumento
    %define ARG3 r8           ; tercer  argumento
    %define ARG4 r9           ; cuarto  argumento
    %define ARG1d ecx
    %define ARG2d edx
    %define ARG3d r8d
    %define ARG4d r9d
    %define ARG3b r8b
    %define ARG4b r9b
%else
    %define ARG1 rdi
    %define ARG2 rsi
    %define ARG3 rdx
    %define ARG4 rcx
    %define ARG1d edi
    %define ARG2d esi
    %define ARG3d edx
    %define ARG4d ecx
    %define ARG3b dl
    %define ARG4b cl
%endif

global asm_contar
global asm_celda
global asm_clamp
global asm_indice

section .text


asm_contar:
    xor     rax, rax            ; contador = 0
    test    ARG1, ARG1          ; buf == NULL ?
    jz      .fin
    test    ARG2, ARG2          ; len <= 0 ?
    jle     .fin
    mov     r10, ARG1           ; r10 = puntero recorre el buffer
    mov     r11, ARG2           ; r11 = bytes restantes
    movzx   r9d, ARG3b          ; r9b = byte objetivo a buscar (3er arg)
.bucle:
    mov     dl, [r10]           ; byte actual
    cmp     dl, r9b
    jne     .siguiente
    inc     rax                 ; coincide -> contador++
.siguiente:
    inc     r10
    dec     r11
    jnz     .bucle
.fin:
    ret

asm_celda:
    movsxd  rax, ARG4d          ; rax = y
    movsxd  r10, ARG2d          ; r10 = ancho
    imul    rax, r10            ; rax = y * ancho
    movsxd  r11, ARG3d          ; r11 = x
    add     rax, r11            ; rax = y * ancho + x
    add     rax, ARG1           ; rax = &mapa[indice]
    movzx   eax, byte [rax]     ; al = mapa[indice]
    ret

asm_indice:
    mov     eax, ARG3d          ; eax = y
    imul    eax, ARG1d          ; eax = y * ancho
    add     eax, ARG2d          ; eax = y * ancho + x
    ret


asm_clamp:
    mov     eax, ARG1d          ; eax = valor
    cmp     eax, ARG2d          ; valor < min ?
    jge     .chk_max
    mov     eax, ARG2d          ; eax = min
    jmp     .fin
.chk_max:
    cmp     eax, ARG3d          ; valor > max ?
    jle     .fin
    mov     eax, ARG3d          ; eax = max
.fin:
    ret