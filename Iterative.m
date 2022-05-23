function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  output_precision(6);
  fid = fopen(nume, 'r');
  N = fgetl(fid); %numarul de site-uri
  N = str2num (N);
  A = zeros(N); %matricea de adiacenta
  L = zeros(1, N); %vectorul ce retine nr. de link-uri ale fiecarei pagini

  for i = 1:N
    %se citeste fiecare linie din fisier
    linie = fgetl(fid);
    linie = str2num(linie);
    
    %completarea matricei A si vectorului L
    L(i) = linie(2);
    for j = 1:L(i)
      A(i,linie(j+2)) = 1;
    endfor
    
    %elimnarea cazurilor in care o pagina contine link spre ea
    if A(i,i) == 1
      A(i,i) = 0;
      L(i) -= 1;
    endif
  endfor

  M = zeros(N); %matricea M din descrierea algoritmului iterativ (Wikipedia)
  for i = 1:N
    for j = 1:N
      if A(j,i) == 1
        M(i,j) = 1/L(j);
      endif
    endfor
  endfor

  aux = ones(N, 1); %vector coloana ce contine doar '1'
  R = ones(N, 1); %vector coloana al PageRank-urilor
  R = R.*1/N; %initializam cu prima iteratie
  
  %se calculeaza iterativ pana la depasirea pragului eps
  while 1
    prevR = R; %retinem R de la pasul anterior
    R = ((1-d)/N)*aux + d*M*prevR;
    if abs(R -  prevR) < eps
      break;
    endif
  endwhile
  R = prevR;
  
  fclose(fid);
endfunction