consolelog("Se resuelve el ejercicio 1, inciso 3.");

N = [-20:20];
s = [-0.5:1e-3:0.5];

consolelog("Se grafican las respuestas de los diferentes sistemas calculadas de manera numerica");
delta_ = delta(N);
for (i = 1:4)
  numericImpResp = equationsSystems{i}(delta_, N);
  [s, tftfRespImp] = TFTD(N, numericImpResp);
  plotSignalAndTFTD(
    N, numericImpResp,
    s, tftfRespImp,
    cstrcat("sistema ", num2str(i)),
    getPlotPath(cstrcat("num_resp_sist_", num2str(i)), GENERAL_GRAPH_PATHS),
    savePlots,
    {'n', strcat('h_', num2str(i), '[n]')}
  );
end
