function [path] = getPlotPath(filename, generalPath)
  % Devuelve el 'path' para ser guardado como grafico

  path = cstrcat(generalPath, filename, ".png");

end
