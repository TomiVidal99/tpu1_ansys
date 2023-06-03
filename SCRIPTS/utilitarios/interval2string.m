function string = interval2string(int, txt = '', forceApplyPi)

  len = length(int);
  step = int(2)-int(1);

  if (forceApplyPi == 'y')
    % force to use pi
    hasPi = 1;
  else if (forceApplyPi == 'n')
    % force to DONT use pi
    hasPi = 0;
  else 
    % decide by algorithm
    hasPi = pidivisibles(step);
  end

  for (i = 1:len)
    if (hasPi == 1)
      number = int(i)/pi;
    else
      number = int(i);
    end
    string{i} = strcat(num2str(number), txt);
  end

end
