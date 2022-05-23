function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare

  %aplicam algoritmul de factorizare Gram-Schmidt  
  [m n] = size(A);
  Q = zeros(m,n);
  R = zeros(n);
  
  for j = 1:n
    for i = 1:j-1
      R(i,j) = Q(:,i)' * A(:,j);
    endfor
    
    s = zeros(m,1);
    for i = 1:j-1
      s = s + R(i,j) * Q(:,i);
    endfor
    aux = A(:,j) - s;
  
    R(j,j) = norm(aux,2);
    Q(:,j) = aux/R(j,j);
  endfor

  %calculul inversei 
  B = zeros(n);
  T = transpose(Q); %inversa matricei ortogonale Q
  for i = 1:n
    x = SST(R, T(:,i));
    B(:,i) = x;
  endfor
endfunction