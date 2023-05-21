% Código para octave que intenta resolver el TPU N°2 de Análisis de Sistemas y Señales.
% Éste es el script principal que ejecuta el resto de scripts.
close all; clear all; clc;

% Se define una variable global que me permite guardar los archivos solo cuando ejecuto el script para entrega.
global savePlots = str2num(argv(){1}); 

% Cargo todas las dependencias.
addpath('SCRIPTS:SCRIPTS/utilitarios');

% Se definen variables globales.
% packages();
% global_variables();
% delta_();
% equations();

% Se grafica la respuesta en frecuencia del sistema.
%TODO ej1_a();

% Se grafican los ceros y los polos.
%TODO ej1_b();

% Se grafica la fase del filtro phy(f) para diferentes valores de a.
% ej2_a();

% Esta línea es importante porque la uso para chequear en compile.sh si todo fue bien.
q();
