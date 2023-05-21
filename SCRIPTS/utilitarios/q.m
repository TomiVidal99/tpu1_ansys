% Se define una función utilitaria para cerrar el script correctamente.
if (savePlots == 0)
  dispc("No se han guardado los gráficos\n", "red");
end
dispc("Programa terminado correctamente.\n Presione ENTER para finalizar...\n", "green");
input("");
close all;
quit;
