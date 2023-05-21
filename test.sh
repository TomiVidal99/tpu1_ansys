#!/bin/bash

if (($1 == 1)); then
  # Ejecutar el código main pero guardando los gráficos.
  octave --traditional --norc main.m 1
else
  # Ejecutar el código main para hacer pruebas en desarrollo.
  octave --traditional --norc main.m 0
fi
