function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

  M = zeros(N); %matricea M din descrierea algoritmului (Wikipedia)
  for i = 1:N
    for j = 1:N
      if A(j,i) == 1
        M(i,j) = 1/L(j);
      endif
    endfor
  endfor

  aux = ones(N, 1); %vector coloana ce contine doar '1'
  %se calculeaza R conform formulelor (Wikipedia)
  B = PR_Inv(eye(N) - d*M);
  R = B * ((1-d)/N)*aux;
  
  fclose(fid);
endfunction