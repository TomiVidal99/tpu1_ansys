function plotSignalAndTFTD(
    N, Senial, s, tftd,
    signalName,
    savePicPath = NaN,
    savePlots,
    overrideSignalXlabel = 0,
    plotImpulse = 0,
    usePlot = 0
  )
  % Función utilitaria que hace una figura con el plot de una señal dada y dos subplots con su TFTD en módulo y fase.

  dispc(cstrcat("Creando gráfico de '", strrep(signalName, "\\", "\\\\"), "' \n"), "blue");

  % Creo una nueva ventana independiente.
  figureNumber = figure('name', signalName);

  function graph(x, y, c, thickness = 2)
    if (usePlot == 0)
      stem(x, y, c, 'linewidth', thickness, 'filled');
    else
      plot(x, y, c, 'linewidth', thickness);
    end
  end

  % Configuro el plot de la senial y n.
  subplot(2, 2, 1:2, "align");
  if (plotImpulse == 1) % Grafico un impulso.
    delta = @(n) (n==0);
    graph(N, delta(N), 'r;\delta[n];', 1); hold on;
    graph(N, Senial, strcat('b', ';', signalName, ';'));
  else
    graph(N, Senial, 'b');
  end

  % Seteo de los nombres de los ejes.
  if (iscell(overrideSignalXlabel) == 0)
    subplotConfig(signalName, 'n', cstrcat(signalName, '[n]'), savePlots);
  else 
    subplotConfig(signalName, overrideSignalXlabel{1}, overrideSignalXlabel{2}, savePlots);
  end

  % Configuro el plot de la TFTD de señal.
  subplot(2, 2, 3);
  plot(s, abs(tftd), 'r', 'linewidth', 2);
  subplotConfig(cstrcat('Modulo de TFTD\{', signalName, '\}'), 's', cstrcat('|TFTD\{', signalName, '\}|'), savePlots);
  xlim([-.5, .5]);
  set(gca,'XTick',-.5:.25:.5);
  grid on;

  % Ploteo la fase de la TFTD de la señal.
  subplot(2, 2, 4);
  plot(s, angle(tftd)/pi, 'r', 'linewidth', 2);
  subplotConfig(cstrcat('Fase de TFTD\{', signalName, '\}'), 's', cstrcat('∠TFTD\{', signalName, '\}(s)'), savePlots);
  xlim([-.5, .5]); set(gca,'XTick',-.5:0.25:.5);
  ylim([-1, 1]); set(gca, 'yticklabel', interval2string([-1:.5:1], '\pi', 0));
  grid on;

  % Guardo el plot en una imagen png.
  if (savePlots == 1 && savePicPath != NaN)
    dispc(cstrcat("Guardando gráfico en '", savePicPath, "' \n"), "yellow");
    print(savePicPath);
  end

end
