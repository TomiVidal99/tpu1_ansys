consolelog("Se resuelve el ejercicio 2, inciso 3");

% Cargo la señal de audio provista.
[x, fs] = audioread("./AnSyS2023_PU1_m/audio.wav");

% Estos son los vectores que se extraen de la señal de audio, y que se obtienen de procesar la señal.
NH = [1:length(x(:, 1))];
audioSignal = x(:, 1);
consolelog('Procesando señal con sistema...');
yOut = ecDiff(x(:, 1));

% Se grafican las señales y se guardan los gráficos.
s1 = {NH, audioSignal, 'Señal original (x)', 'Amplitud normalizada', 'Muestras'};
s2 = {NH, yOut, 'Señal procesada (y)', 'Amplitud normalizada', 'Muestras'};
twoSubplots(
  'Audio original y audio procesado con el sistema.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'yAntesDeGuardar'),
  'auto',
  1.25
);

% Se le pregunta al usuario si quiere reproducir el audio antes de que se guarde y se normalice.
listenAudio('Audio procesado', yOut, fs);

% Se guarda el audio procesado en un archivo.
audiowrite(
  cstrcat(AUDIO_FOLDER, 'audioProcesadoConSistema.wav'),
  yOut,
  fs
);
