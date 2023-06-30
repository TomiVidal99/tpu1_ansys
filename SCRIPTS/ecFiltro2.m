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
    y[n] = x[n] - a.x[n-n0] + a^2.x[x-2n0] - a^2.x[x-3n0]
  %}

  % Constantes.
  n0 = 8820;
  n1 = 2*n0;
  n2 = 3*n0;
  a = (2/5);
  b = a^2;
  c = a^3;
  
  % Algoritmo.
  for (k = 1:length(x))
    term1=0;
    term2=0;
    term3=0;
    if (k-n0 > 0)
      term1 = a*x(k-n0);
    end
    if (k-n1 > 0)
      term2 = b*x(k-n1);
    end
    if (k-n2 > 0)
      term3 = c*x(k-n2);
    end
    y(k) = x(k) - term1 + term2 - term3;
  end

end
