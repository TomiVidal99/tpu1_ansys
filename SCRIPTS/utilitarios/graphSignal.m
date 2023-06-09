function graphSignal(
  n, x,
  signalName = "Señal",
  savePlots, savePicPath = NaN,
  figureNumber = '',
  customLimits = {},
  customSteps = {},
  beforeSaveCallback="",
  useStem = 0
  )
  % Se grafica una señal con vector de pasos 'n' y amplitud 'x'
  % el grafico se prepara para ser guardado

  dispc(cstrcat("Creando gráfico de '", strrep(signalName, "\\", "\\\\"), "' \n"), "blue");

  % Creo una nueva ventana independiente.
  if (isinteger(figureNumber) == 0 && isfloat(figureNumber) == 0)
    fig = figure('name', signalName);
  else
    fig = figure(figureNumber, 'name', signalName);
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
  if (useStem == 1)
    stem(n, x, "linewidth", plotLinewidth, "filled");
  else
    plot(n, x, "linewidth", plotLinewidth);
  end
  grid on;
  set(gca, "linewidth", plotLinewidth, "fontsize", plotFontSize);

  % Agrego limites personalizados
  if (length(customLimits) == 1)
    xlim(customLimits{1});
  elseif (length(customLimits) == 2)
    xlim(customLimits{1});
    ylim(customLimits{2});
  end

  % Agrego paso con el que se recorren los ejes personalizados
  if (length(customSteps) == 1)
    limits = axis();
    set(gca, 'xtick', limits(1):customSteps{1}:limits(2));
  elseif (length(customSteps) == 2)
    limits = axis();
    set(gca, 'xtick', limits(1):customSteps{1}:limits(2));
    set(gca, 'ytick', limits(3):customSteps{2}:limits(4));
  end

  % Le pongo titulo
  title(signalName);

  % callback para aplicar cambios particulares al plot antes de guardar
  if (strcmp(typeinfo(beforeSaveCallback), "null_string") == 0 || strcmp(typeinfo(beforeSaveCallback), "string") == 0)
    beforeSaveCallback();
  end

  % Guardo el plot en una imagen png.
  if (savePlots == 1 && savePicPath != NaN)
    dispc(cstrcat("Guardando gráfico en '", savePicPath, "' \n"), "yellow");
    print(savePicPath);
  end

end
