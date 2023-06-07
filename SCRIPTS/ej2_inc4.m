% FILTRO 1
% Se calcula y grafica la respuesta impulsional del filtro 1.
labels = {'n', 'F1(\delta[n])'}; customLimits = {[0, 28e3], 'auto', 10e3, .25};
simplePlot(
  NH, ecFiltro1(ecDiff(delta(NH-1))), % Desplazo el vector por que NH comienza en 1.
  'h_{f1}[n]', 
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

% Se grafican la salida de y de despues de ser procesada con el filtro 1.
s1 = {NH, audioSignal, 'Señal original'};
s2 = {NH, yFiltro1, 'Señal filtrada por F1'};
twoSubplots(
  'Ej2-i4: Salida del filtro 1.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'y-filtro1'),
  'auto',
  1.25
);

% FILTRO 2

% Mensaje de logeo.
consolelog('Inciso 4: Se aplica y grafica el Filtro 2.');

% Se calcula y grafica la respuesta impulsional del filtro 2.
labels = {'n', 'F2(y[n])'};
simplePlot(
  NH, ecFiltro1(ecFiltro2(ecDiff(delta(NH-1)))), % Desplazo el vector por que NH comienza en 1.
  'Respuesta impulsional del filtro 2 en cascada con el filtro 1', 
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'h-filtro2'),
  labels
);

% Se filtra la salida de y con el filtro 2 en cascada con el filtro 1.
yFiltro2 = ecFiltro1(ecFiltro2(yOut));

% Se le pregunta al usuario si quiere escuchar la salida del filtro 2.
listenAudio('Salida del Filtro 2', yFiltro2, fs);

% Se guarda la salida del filtro 2.
audiowrite(
  cstrcat(AUDIO_FOLDER, 'salidaFiltro2.wav'),
  yFiltro2,
  fs
);

% Se grafican la salida de y de despues de ser procesada con el filtro 2.
s1 = {NH, audioSignal, 'Señal original'};
s2 = {NH, yFiltro2, 'Señal filtrada por F2'};
twoSubplots(
  'Ej2-i4: Salida del filtro 2.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'y-filtro2'),
  'auto',
  1.25
);
