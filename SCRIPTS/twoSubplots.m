function [figureNumber] = twoSubplots(
  windowTitle,
  s1, s2,
  savePlots = 0, savePath = '',
  xlimits = {},
  ylimits = {},
  beforeSaveCallback = {}
  )
  %{
    Función utilitaria que grafica en una misma ventana
    dos plots.
    Definición: function [figureNumber] = twoSubplots(windowTitle, s1, s2, options)
    Uso: twoSubplots("señal 1 y 2", signal1, signal2, options);
      - windowTitle (STRING)
      - signal1 y signal2 (STRUCT)
        - {(VECTOR), (FUNCIÓN ANÓNIMA o VECTOR), (STRING)}
        - signal1 = {[1,2,3], @(n) n+1, 'titulo'}
  %}

  % Función para configurar el aspecto del gráfico.
  function setUpPlot(st)
    title(st{3});
    grid on;
    if (length(xlimits) == 1)
      xlim(xlimits{1}); %set(gca,'XTick',-xlimits:.25:xlimits);
    end
    if (length(ylimits) == 1)
      ylim(ylimits{1}); %set(gca,'YTick',-ylimits:.25:ylimits);
    end

    % Leyenda de los ejes
    argsAmount = length(st);
    if (argsAmount == 3)
      xlabel('n'); ylabel(st{3});
    elseif (argsAmount == 4)
      xlabel('n'); ylabel(st{4});
    elseif (argsAmount == 5)
      xlabel(st{5}); ylabel(st{4});
    end
  end

  % Mensaje de logeo.
  dispc(
    cstrcat('Creando gráfico ', windowTitle, '.\n'),
    'blue'
  );

  figureNumber = figure('name', windowTitle);

  % First plot
  subplot(2, 1, 1);
  if (strcmp(typeinfo(s1{2}), 'matrix') == 1)
    plot(s1{1}, s1{2}, 'b', 'linewidth', 3);
  else
    plot(s1{1}, s1{2}(s1{2}), 'b', 'linewidth', 3);
  end
  setUpPlot(s1);

  % Second plot
  subplot(2, 1, 2);
  if (strcmp(typeinfo(s2{2}), 'matrix') == 1)
    plot(s2{1}, s2{2}, 'b', 'linewidth', 3);
  else
    plot(s2{1}, s2{2}(s2{2}), 'b', 'linewidth', 3);
  end
  setUpPlot(s2);

  % Callback despues de graficar
  if (strcmp(typeinfo(beforeSaveCallback), "null_string") == 0 || strcmp(typeinfo(beforeSaveCallback), "string") == 0)
    beforeSaveCallback();
  end

  % Se guarda el gráfico.
  if (savePlots == 1)
    dispc(cstrcat("Se guardará '", savePath, "'\n"), 'yellow');
    print(savePath);
  end

end
