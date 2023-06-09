% Código para Octave que intenta resolver el TPU N°1 de Análisis de Sistemas y Señales.
% Éste es el script principal que ejecuta el resto de scripts.

close all; clear all; clc;

% Cargo las direcciones de todas las dependencias.
addpath("SCRIPTS");
addpath("SCRIPTS/utilitarios");
addpath("./AnSyS2023_PU1_m");

% Se define una variable global que me permite guardar los archivos solo cuando ejecuto el script para entrega.
if (length(argv()) > 0)
  if (isWindows() == 1)
    global savePlots = 1;
  else
    global savePlots = str2num(argv(){1});
  end
else
  global savePlots = 0;
end

% Se definen variables globales.
global_variables();
equations();

if (savePlots == 1)
  dispc(cstrcat("Los gráficos se guardarán en '", GENERAL_GRAPH_PATHS, "'\n"), "yellow");
else
  dispc("Los gráficos NO se guardarán\n", "yellow");
end

% Se resuelve el EJERCICIO 1.
[nSignal, signal] = getSignal(); % Se obtiene la señal provista
ej1_inc1();
ej1_inc2();
ej1_inc3();
ej1_inc4();

% Se resuelve el EJERCICIO 2.
[nCanal, hCanal] = getHCanald();
ej2_inc1();
ej2_inc3();
ej2_inc4(); % la ejecucion de este script requiere de ej2_inc3

% Esta línea es importante porque la uso para chequear en compile.sh si todo fue bien.
q();
