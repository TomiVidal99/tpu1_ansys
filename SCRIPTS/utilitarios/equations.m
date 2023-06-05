% Defino las ecuaciones analíticas.

consolelog('Defino las ecuaciones de los sistemas y sus respuestas analiticas.');

% Sistema 1.
function [y] = Y1(x, n)
  y(1) = 0; % Condición inicial.
  for (k = 2:length(n))
    y(k) = (.5).*x(k) + (.5).*x(k-1);
  end
end
y1 = @(x, n) Y1(x, n);
impResp1 = @(n) 0.5.*((n==0)+(n==1));
freqResp1 = @(s) 0.5.*(1+exp(-j*2*pi.*s));

% Sistema 2.
function [y] = Y2(x, n)
  y(1) = 0; % Condición inicial.
  for (k = 2:length(n))
    y(k) = (.5).*x(k) - (.5).*x(k-1);
  end
end
y2 = @(x, n) Y2(x, n);
impResp2 = @(n) 0.5.*((n==0)-(n==1));
freqResp2 = @(s) 0.5.*(1-exp(-j*2*pi.*s));

% Sistema 3.
function [y] = Y3(x, n)
  y(1) = 0; % Condición inicial.
  for (k = 2:length(n))
    y(k) = (.25).*x(k) + (.25).*x(k-1) + (.5).*y(k-1);
  end
end
y3 = @(x, n) Y3(x, n);
impResp3 = @(n) 0.25.*( ((0.5).^(n)).*u(n) + ((0.5).^(n-1)).*u(n-1) );
freqResp3 = @(s) 0.25.*((1+exp(-j*2*pi.*s))./(1-0.5.*exp(-j*2*pi.*s)));

% Sistema 4.
function [y] = Y4(x, n)
  y(1) = 0; % Condición inicial.
  for (k = 2:length(n))
    y(k) = (.25).*x(k) - (.25).*x(k-1) - (.5).*y(k-1);
  end
end
y4 = @(x, n) Y4(x, n);
impResp4 = @(n) 0.25.*( ((-0.5).^(n)).*u(n) - ((-0.5).^(n-1)).*u(n-1) );
freqResp4 = @(s) 0.25.*((1-exp(-j*2*pi.*s))./(1+0.5.*exp(-j*2*pi.*s)));

% Struct que contiene los sistemas.
equationsSystems = {y1, y2, y3, y4};
impResp = {impResp1, impResp2, impResp3, impResp4};
freqsResps = {freqResp1, freqResp2, freqResp3, freqResp4};
