function y = ecDiff(x)
  % Creo una función que implementa el sistema encontrado en el ejercicio 2, inciso 2.

  % El algoritmo sólo acepta que x sea vector.
  if (
      strcmp(typeinfo(x), 'bool matrix') == 0 &&
      strcmp(typeinfo(x), 'matrix') == 0
  )
    dispc('ERROR: x debe ser vector.\n', 'red');
    exit(1);
  end

  %{
    La ecuación a resolver es:
    y[n] = x[n] + a.x[n-n0] + b.x[n-n1]
  %}

  % Constantes.
  n0 = 8820;
  n1 = 2*n0;
  a = (2/5);
  b = a^2;
  
  % Algoritmo.
  for (k = 1:length(x))
    term1=0;term2=0;
    if (k-n0 > 0)
      term1 = a*x(k-n0);
    end
    if (k-n1 > 0)
      term2 = b*x(k-n1);
    end
    y(k) = x(k) + term1 + term2;
  end

end
