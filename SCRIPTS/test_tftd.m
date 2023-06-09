% Mensaje de progreso para la consola.
consolelog('Gráficos de las pruebas del algoritmo de la TFTD.');

% script para corroborar que el algoritmo de aproximación de la TFTD es correcto.
N0 = [1:100];

% Delta desplazada 20.
Senial1 = zeros(size(N0));
Senial1(20) = 1;
[s1, tftd1] = TFTD(N0, Senial1);

% Triangulo desplazado 50 y de base 5.
Senial2 = tri((N0-length(N0)/2)/5);
[s2, tftd2] = TFTD(N0, Senial2);

% Grafico estas señales en otras ventana.
plotSignalAndTFTD(
  N0, Senial1, s1, tftd1,
  '\delta[n-n_0]',
  getPlotPath("delta_tftd", GENERAL_GRAPH_PATHS),
  savePlots
);
plotSignalAndTFTD(
  N0, Senial2, s2, tftd2,
  '\Lambda[an-b]',
  getPlotPath("triangulo_tftd", GENERAL_GRAPH_PATHS),
  savePlots
);

% Defino los calculos analiticos de las transformadas y graficos las señales
tftdAnaliticSenial1 = @(s) exp(-j*2*pi*20.*s);
plotSignalAndTFTD(
  N0, Senial1, s1, tftdAnaliticSenial1(s1),
  '\delta[n-20]',
  getPlotPath("delta_tftd_analitica", GENERAL_GRAPH_PATHS),
  savePlots
);
tftdAnaliticSenial2 = @(s) (5).*(exp(-j*2*pi*10.*s)).*(sinc(5.*s).^2);
plotSignalAndTFTD(
  N0, Senial2, s2, tftdAnaliticSenial2(s2),
  '\Lambda[5n-50]',
  getPlotPath("triangulo_tftd_analitica", GENERAL_GRAPH_PATHS),
  savePlots
);
