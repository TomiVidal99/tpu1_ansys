function graphSignal(n, x, signalName = "Señal", savePlots, savePicPath = NaN, figureNumber = '')
  % Se grafica una señal con vector de pasos 'n' y amplitud 'x'
  % el grafico se prepara para ser guardado

  consolelog(cstrcat("Creando gráfico de '", signalName, "' \n"));

  % Creo una nueva ventana independiente.
  if (isinteger(figureNumber) == 0 && isfloat(figureNumber) == 0)
    fig = figure('name', signalName);
  else
    figure(figureNumber, 'name', signalName);
  end

  % Se grafica la señal
  if (savePlots == 1)
    plotLinewidth = 2;
    plotFontSize = 16;
  else
    plotLinewidth = 4;
    plotFontSize = 23;
  end
  colorMap = rand(length(n), 3);
  hold on;
  plot(n, x, "linewidth", plotLinewidth);
  grid on;
  set(gca, "linewidth", plotLinewidth, "fontsize", plotFontSize);

  % Le pongo titulo
  title(signalName);

  % Guardo el plot en una imagen png.
  if (savePlots == 1 && savePicPath != NaN)
    dispc(cstrcat("Guardando gráfico en '", savePicPath, "' \n"), "yellow");
    print(savePicPath);
  end

end
