% Código para octave que intenta resolver el TPU N°2 de Análisis de Sistemas y Señales.
% Éste es el script principal que ejecuta el resto de scripts.
close all; clear all; clc;

% Se define una variable global que me permite guardar los archivos solo cuando ejecuto el script para entrega.
global savePlots = str2num(argv(){1}); 

% Cargo las direcciones de todas las dependencias.
addpath('SCRIPTS:SCRIPTS/utilitarios');
addpath('./AnSyS2023_PU1_m');

% Se definen variables globales.
% packages();
global_variables();
disp("lkdsjsalkdja");
consolelog(cstrcat("exists: ", GENERAL_GRAPH_PATHS));
% delta_();
% equations();

consolelog("LASKDJLAKD");

% Se resuelve el ejercicio 1 inciso 1
ej1_inc1();

% Esta línea es importante porque la uso para chequear en compile.sh si todo fue bien.
q();
