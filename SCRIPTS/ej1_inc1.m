% se obtiene la señal
[n, x] = getSignal();

% Se grafica la señal
graphSignal(n, x, "Senial", savePlots, getPlotPath("senial", GENERAL_GRAPH_PATHS));

% Corroboro que el algoritmo de TFTD que implemente es correcto
% haciendo la TFTD de pares conocidos de los cuales se el resultado
test_tftd();

% Se grafica la TFTD de la señal dada
[sSenial, tftdSenial] = TFTD(n, x);
plotSignalAndTFTD(
  n, x, sSenial, tftdSenial,
  'senial',
  getPlotPath("senial_y_su_tftd", GENERAL_GRAPH_PATHS),
  savePlots
);
