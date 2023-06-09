function [y] = ecFiltro2(x)
  % Se implementa el filtro 2 que yo creé.

  % El algoritmo sólo acepta que n y x sean vectores.
  if (
      strcmp(typeinfo(x), 'bool matrix') == 0 &&
      strcmp(typeinfo(x), 'matrix') == 0
  )
    dispc('ERROR: x y n deben ser vectores.\n', 'red');
    exit(1);
  end

  %{
    La ecuación a resolver es:
    y[n] = x[n] + a^3.x[n-3n0]
  %}

  % Constantes.
  n0 = 8820;
  n1 = 3*n0;
  a = (2/5);
  b = a^3;
  
  % Algoritmo.
  for (k = 1:length(x))
    term1=0;
    if (k-n1 > 0)
      term1 = b*x(k-n1);
    end
    y(k) = x(k) + term1;
  end

end
