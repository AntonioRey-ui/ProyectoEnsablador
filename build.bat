@echo off
setlocal

if "%1"=="clean" goto clean

echo [1/3] Ensamblando funciones.asm (formato win64)...
nasm -f win64 asm\funciones.asm -o funciones.obj
if errorlevel 1 goto error

echo [2/3] Compilando codigo C...
gcc -c -O2 -Wall -Isrc src\main.c   -o main.obj   || goto error
gcc -c -O2 -Wall -Isrc src\game.c   -o game.obj   || goto error
gcc -c -O2 -Wall -Isrc src\render.c -o render.obj || goto error
gcc -c -O2 -Wall -Isrc src\input.c  -o input.obj  || goto error

echo [3/3] Enlazando bitquest.exe...
gcc main.obj game.obj render.obj input.obj funciones.obj -o bitquest.exe || goto error

echo.
echo compilacion exitosa: bitquest.exe
if "%1"=="run" (
    echo Ejecutando...
    bitquest.exe
)
goto fin

:clean
del /q *.obj bitquest.exe 2>nul
echo limpieza completa.
goto fin

:error
echo.
echo *** Error en la compilacion ***
exit /b 1

:fin
endlocal