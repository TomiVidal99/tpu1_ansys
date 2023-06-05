consolelog("Se resuelve el ejercicio 1, inciso 2.");

equations();

N = [-20:20];
s = [-0.5:1e-3:0.5];

consolelog("Se grafican las respuestas de los diferentes sistemas de manera analitica");
for (i = 1:4)
  plotSignalAndTFTD(
    N, impResp{i}(N), 
    s, freqsResps{i}(s),
    cstrcat("h_", num2str(i), "[n]"),
    getPlotPath(cstrcat("resp_sist_", num2str(i)), GENERAL_GRAPH_PATHS),
    savePlots
    % {'n', strcat('h_', num2str(i), '[n]')}
  );
end
