% Mensaje de progreso para la consola.
consolelog('Gráficos de las pruebas del algoritmo de la TFTD.');

% script para corroborar que el algoritmo de aproximación de la TFTD es correcto.
N0 = [1:100];

% Triangulo desplazado 50 y de base 5.
Senial1 = tri((N0-length(N0)/2)/5);
[s1, tftd1] = TFTD(N0, Senial1);

% Delta desplazada 20.
Senial2 = zeros(size(N0));
Senial2(20) = 1;
[s2, tftd2] = TFTD(N0, Senial2);

% Grafico estas señales en otras ventana.
plotSignalAndTFTD(
  N0, Senial1, s1, tftd1,
  'Triángulo',
  getPlotPath("triangulo_tftd", GENERAL_GRAPH_PATHS),
  savePlots
);
plotSignalAndTFTD(
  N0, Senial2, s2, tftd2,
  'Delta',
  getPlotPath("delta_tftd", GENERAL_GRAPH_PATHS),
  savePlots
);
