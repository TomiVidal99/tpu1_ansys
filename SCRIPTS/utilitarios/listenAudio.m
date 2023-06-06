function [response] = listenAudio(signalName, audioSignal, fs, defaultResponse = 'a')
  % Se le pregunta al usuario si quiere reproducir el audio antes de que se guarde y se normalice.
  response = defaultResponse;
  while (response != 'n' && response != 's')
    dispc(
      cstrcat('\n\nReproducir ', signalName, '? [s/n] \n'), 
      'light yellow'
    );
    response = kbhit();
  end
  if (response == 's')
    dispc(cstrcat('Reproduciendo ', signalName, '...\n'), 'light yellow');
    sound(audioSignal, fs);
  end
end
