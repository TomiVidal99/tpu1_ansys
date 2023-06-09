consolelog("Se resuelve el ejercicio 2, inciso 3");

% Cargo la señal de audio provista.
[givenAudioSignal, fs] = audioread("./AnSyS2023_PU1_m/audio.wav");

% Estos son los vectores que se extraen de la señal de audio, y que se obtienen de procesar la señal.
NH = [1:length(givenAudioSignal(:, 1))];
audioSignal = givenAudioSignal(:, 1); % Señal de audio provista
consolelog('Procesando señal con sistema...');
yOut = ecDiff(givenAudioSignal(:, 1)); % Señal que se obtiene a la salida del canald

function indicateEcosInSignal()
  annotation("rectangle", [0.4 0.2 0.025 0.14], "color", "red", "linewidth", 1, "linestyle", "-.");
  annotation("rectangle", [0.515 0.2 0.02 0.14], "color", "red", "linewidth", 1, "linestyle", "-.");
  text(25000, 0.55, "Ecos", "color", "red", "fontsize", 12, "fontweight", "bold");
end

% Se grafican las señales y se guardan los gráficos.
s1 = {NH, audioSignal, 'Señal original (x)', 'Amplitud normalizada', 'Muestras'};
s2 = {NH, yOut, 'Señal procesada (y)', 'Amplitud normalizada', 'Muestras'};
twoSubplots(
  'Audio original y audio procesado con el sistema.',
  s1, s2,
  savePlots,
  createFilepath(GENERAL_GRAPH_PATHS, 'salidaCanalDigital'),
  {[0, length(NH)]},
  {[-0.75, 0.75]},
  @indicateEcosInSignal
);

% Se le pregunta al usuario si quiere reproducir el audio antes de que se guarde y se normalice.
listenAudio('Audio procesado', yOut, fs);

% Se guarda el audio procesado en un archivo.
audiowrite(
  cstrcat(AUDIO_FOLDER, 'audioProcesadoConSistema.wav'),
  yOut,
  fs
);
