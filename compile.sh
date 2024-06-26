#!/bin/bash

# Script utilitario para preparar todo el trabajo (así no olvido nada):
#   - Correr octave sin definir las funciones utilitarias globales (que uso en mi sistema).
#   - Compilar el pdf (con pdflatex).
#   - Copiar las dependencias correspondientes (mover a la carpeta 'ENTREGA').
#   - Crear los archivos .zip ('AnSyS-pu1-scripts-APELLIDO.zip' y 'AnSyS-pu1-APELLIDO.pdf').

# # Le muestro al usuario si hay cosas que hacer todavía en el código.
# PATTERN="TODO:"
# HAS_TODOS=$(cat main.m ./SCRIPTS/**/*.m INFORME/main.tex | grep "TODO")
# if ! [ -z "$HAS_TODOS" ]; then
#   echo $HAS_TODOS
#   echo "Hay cosas que terminar primero"
#   exit 1
# fi
# 
# # Corro octave sin ejecutar .octaverc
# HAS_ERRORS=$(octave --traditional --norc ./main.m 1 | grep "Programa terminado correctamente")
# if [ -z $HAS_ERRORS ]; then
#   echo ""; echo "";
#   echo "ERROR en octave, no se puede entregar."
#   echo "Seguramente falte alguna dependencia."
#   exit 1
# fi

# Compilar el pdf
cd ./INFORME/
pdflatex "main.tex" -no-shell-escape
cd ..

# Verifico que existe la carpeta de ENTREGA, sino la creo
if [ ! -d "./ENTREGA" ]; then
  mkdir ENTREGA
fi

# Copiar las dependencias
rm -rf ./ENTREGA/* # Borrar archivos antiguos.
zip -u ./ENTREGA/AnSyS-pu1-scripts-VIDAL.zip main.m
zip -u ./ENTREGA/AnSyS-pu1-scripts-VIDAL.zip SCRIPTS
cp ./INFORME/main.pdf ./ENTREGA/
mv ./ENTREGA/main.pdf ./ENTREGA/AnSyS-pu1-VIDAL.pdf

echo Finalizado.
