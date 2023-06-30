function [y] = ecFiltro1(x)
  % Se implementa el filtro 1.

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
    y[n] = x[n] - a.x[n-n0] + a^2.x[n-2n0]
  %}

  % Constantes.
  n0 = 8820;
  n1 = 2*n0;
  a = (2/5);
  b = a^2;
  
  % Algoritmo.
  for (k = 1:length(x))
    term1=0;
    term2=0;
    if (k-n0 > 0)
      term1 = a*x(k-n0);
    end
    if (k-n1 > 0)
      term2 = b*x(k-n1);
    end
    y(k) = x(k) - term1 + term2;
  end

end
