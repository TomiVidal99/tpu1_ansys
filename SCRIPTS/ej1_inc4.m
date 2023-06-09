consolelog("Se resuelve el ejercicio 1, inciso 4.");

% Se calculan y grafican las diferentes respuestas de los filtros a senial
for (i = 1:4)
  filteredSignal = equationsSystems{i}(signal, nSignal);
  [s, tftfProcessedSignal] = TFTD(nSignal, filteredSignal);
  customLimitsY = {};
  if (i == 2 || i == 4)
    customLimitsY = {[-0.25, 0.25]};
  end
  plotSignalAndTFTD(
    nSignal, filteredSignal,
    s, tftfProcessedSignal,
    cstrcat("Senial_", num2str(i)),
    getPlotPath(cstrcat("senial_filtrada_", num2str(i)), GENERAL_GRAPH_PATHS),
    savePlots,
    overrideSignalXlabel = 0,
    plotImpulse = 0,
    usePlot = 1,
    customLimitsY
  );
end
