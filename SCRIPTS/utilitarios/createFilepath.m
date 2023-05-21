function [fullpath] = createFilepath(generalPath, path, ext='.png')
  % Función utilitaria para unir una dirección.
  fullpath = cstrcat(generalPath, path, ext);
end
