% FILTRO 1
% Se calcula y grafica la respuesta impulsional del filtro 1.
labels = {'n', 'h_{f1}(\delta[n])'}; customLimits = {[0, 28e3], 'auto', 10e3, .25};
simplePlot(
  NH, ecFiltro1(delta(NH-1)), % Desplazo el vector por que NH comienza en 1.
  'Respuesta impulsional del filtro 1 (dos ramas)', 
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'h-filtro1'),
  labels,
  customLimits
);

% Se filtra la salida de y con el filtro 1.
yFiltro1 = ecFiltro1(yOut);

% Se le pregunta al usuario si quiere escuchar la salida del filtro 1.
listenAudio('Salida del filtro 1', yFiltro1, fs);

% Se guarda la salida del filtro 1.
audiowrite(
  cstrcat(AUDIO_FOLDER, 'salidaFiltro1.wav'),
  yFiltro1,
  fs
);

% Se indican los ecos
function indicateEcosInSignal()
  annotation("rectangle", [0.515 0.21 0.025 0.14], "color", "red", "linewidth", 1, "linestyle", "-.");
  text(35000, 0.55, "Eco", "color", "red", "fontsize", 12, "fontweight", "bold");
end

% Se grafican la salida de y de despues de ser procesada con el filtro 1.
s1 = {NH, audioSignal, 'Señal original'};
s2 = {NH, yFiltro1, 'Señal filtrada por F1 (dos ramas)'};
twoSubplots(
  'Ej2-i4: Salida del filtro 1.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'y-filtro1'),
  {[0, length(NH)]},
  {[-0.75, 0.75]},
  @indicateEcosInSignal
);

% FILTRO 2

% Mensaje de logeo.
consolelog('Inciso 4: Se aplica y grafica el Filtro 2.');

% Se calcula y grafica la respuesta impulsional del filtro 2.
labels = {'n', 'h_{f2}(\delta[n])'};
simplePlot(
  NH, ecFiltro2(delta(NH-1)), % Desplazo el vector por que NH comienza en 1.
  'Respuesta impulsional del filtro 2 (tres ramas)', 
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'h-filtro2'),
  labels
);

% Se filtra la salida de y con el filtro 2.
yFiltro2 = ecFiltro2(yOut);

% Se le pregunta al usuario si quiere escuchar la salida del filtro 2.
listenAudio('Salida del Filtro 2', yFiltro2, fs);

% Se guarda la salida del filtro 2.
audiowrite(
  cstrcat(AUDIO_FOLDER, 'salidaFiltro2.wav'),
  yFiltro2,
  fs
);

function indicateEcosInSignal2()
  annotation("rectangle", [0.515 0.21 0.025 0.14], "color", "red", "linewidth", 1, "linestyle", "-.");
  annotation("rectangle", [0.625 0.21 0.025 0.14], "color", "red", "linewidth", 1, "linestyle", "-.");
  text(35000, 0.55, "Ecos", "color", "red", "fontsize", 12, "fontweight", "bold");
end
% Se grafican la salida de y de despues de ser procesada con el filtro 2.
s1 = {NH, audioSignal, 'Señal original'};
s2 = {NH, yFiltro2, 'Señal filtrada por F2 (tres ramas)'};
twoSubplots(
  'Ej2-i4: Salida del filtro 2.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'y-filtro2'),
  {[0, length(NH)]},
  {[-0.75, 0.75]},
  @indicateEcosInSignal2
);
