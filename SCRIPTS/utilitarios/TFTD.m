function [s, tftd] = TFTD(n, signal, defaultStep=1e-3)
  %{
    Aproximación la transformada de Fourier de tiempo discreto 
    Uso: [s, tftd] = TFTD([0,0,0,0,0], [0,0,1,0,0]);
  %}

  ds = defaultStep; s = [-.5:ds:.5]; tftd = zeros(size(s));
  for k = 1:length(s)
    tftd(k) = sum(signal.*exp(-1j*2*pi*s(k)*n));
  end

end
