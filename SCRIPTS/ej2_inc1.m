consolelog("Se resuelve el ejercicio 2, inciso 1.");

consolelog("Se grafica la señal HCanald")
graphSignal(
  nCanal, hCanal, "HCanald",
  savePlots, getPlotPath("hcanald", GENERAL_GRAPH_PATHS),
  figureNumber = '',
  customLimits = {},
  customSteps = {},
  beforeSaveCallback="",
  1,
  {"n", "h_{c}[n]"}
);

consolelog("Se grafica la señal hcanald obtenida analiticamente");
analiticHcanald = @(n) (n==0) + (2/5).*(n==8820) + (4/25).*(n==17640);
graphSignal(
  nCanal, analiticHcanald(nCanal), "HCanald Analítica",
  savePlots, getPlotPath("hcanald_analitica", GENERAL_GRAPH_PATHS),
  figureNumber = '',
  customLimits = {},
  customSteps = {},
  beforeSaveCallback="",
  1,
  {"n", "h_{ca}[n]"}
);
