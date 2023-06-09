% Se define una función utilitaria para cerrar el script correctamente.
if (savePlots == 0)
  dispc("\n\nNo se han guardado los gráficos\n", "red");
end
dispc("\n\nPrograma terminado correctamente.\n Presione ENTER para finalizar...\n", "green");
dispc("\nACLARACION: cuando se presione ENTER se cerraran los graficos\n\n", "red");
input("");
close all;

if (isWindows() == 0)
  quit;
end
