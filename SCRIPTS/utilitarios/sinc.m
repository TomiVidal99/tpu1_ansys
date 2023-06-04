function x = sinc(n)
  func = @(t) sin(pi.*t)./(pi.*t);
  x = func(n);
end
