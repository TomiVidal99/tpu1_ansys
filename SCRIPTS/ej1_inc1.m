% se obtiene la señal
[n, x] = getSignal();

% Se grafica la señal
graphSignal(n, x, "Senial", savePlots, getPlotPath("senial", GENERAL_GRAPH_PATHS));

% Corroboro que el algoritmo de TFTD que implemente es correcto
% haciendo la TFTD de pares conocidos de los cuales se el resultado
test_tftd();
