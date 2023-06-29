consolelog("Se resuelve el ejercicio 1, inciso 1.");

% Corroboro que el algoritmo de TFTD que implemente es correcto
% haciendo la TFTD de pares conocidos de los cuales se el resultado
test_tftd(); % TODO

% Se grafica la señal
graphSignal(
  nSignal, signal, "Senial",
  savePlots, getPlotPath("senial", GENERAL_GRAPH_PATHS),
  "",
  {},
  {},
  "",
  0,
  {"n", "Senial[n]"} 
);


% Se grafica la TFTD de la señal dada
[sSenial, tftdSenial] = TFTD(nSignal, signal);
plotSignalAndTFTD(
  nSignal, signal, sSenial, tftdSenial,
  'senial',
  getPlotPath("senial_y_su_tftd", GENERAL_GRAPH_PATHS),
  savePlots,
  overrideSignalXlabel = 0,
  plotImpulse = 0,
  usePlot = 1
);

% Se grafica la TFTD y se señalan las componentes de alta y baja frecuencia
function indicateFreqsComponents
  % Grafico las indicaciones de cuáles son las altas y las bajas frecuencias.
  hold on;
  annotation("textarrow", [0.25 0.14], [0.4 0.2], "string", "Altas frecuencias", "fontsize", 10, "fontweight", "bold");
  annotation("textarrow", [0.4 0.5], [0.8 0.55], "string", "Bajas frecuencias predominantes", "fontsize", 10, "fontweight", "bold");
  annotation("textarrow", [0.8 0.9], [0.7 0.2], "string", "Altas frecuencias", "fontsize", 10, "fontweight", "bold");
end
% figure();
% plot(sSenial, abs(tftdSenial), "r", "linewidth", 4);
graphSignal(
  sSenial, abs(tftdSenial),
  "|TFTD\\{senial\\}|",
  savePlots, getPlotPath("tftd_senial_freqs", GENERAL_GRAPH_PATHS),
  "",
  {[-.5, .5]},
  {0.1},
  @indicateFreqsComponents,
  0,
  {"s", "|Senial(e^{j2\pis})|"}
);
