function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

	%din conditiile de continuitate calculam a si b
  a = 1/(val2 - val1);
  b = -a * val1;
  
  %se stabileste cazul curent si se calculeaza y
  if x>=0 && x<val1
    y = 0;
  endif
  if x>=val1 && x<=val2
    y = a*x + b;
  endif
  if x>val2 && x<=1
    y = 1;
  endif
endfunction