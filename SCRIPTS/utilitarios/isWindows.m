function os = isWindows()
  % devuelve el sistema operativo actual.
  % "windows" o "linux"

  currentSystem = {uname.release};

  stringContains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
  
  if (stringContains(currentSystem, "Windows") == 1)
    os = 1;
  else
    os = 0;
  end

end
