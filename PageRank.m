function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

  output_precision(6);
  fid = fopen(nume, 'r');
  N = fgetl(fid); %numarul de site-uri
  N = str2num (N);
  
  %trecem peste descrierea nodurilor din fisier pt. a citi val1 si val2
  for i = 1:N
    linie = fgetl(fid);
  endfor
  val1 = fgetl(fid);
  val2 = fgetl(fid);
  val1 = str2num(val1);
  val2 = str2num(val2);
  
  %apelul functiilor ce calculeaza PageRank-ul
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);  
  R3 = sort(R2, 'descend'); %sortam vectorul R2 descrescator
  fclose(fid);
  
  %concatenam ".out" la numele fisierului de intrare
  nume_out = [nume '.out'];
  fout = fopen(nume_out, 'w');
  
  %afisarea tuturor datelor
  fprintf(fout, "%d\n", N);
  for i = 1:N
    fprintf(fout, "%0.6f\n", R1(i));
  endfor
  fprintf(fout, "\n");
  for i = 1:N
    fprintf(fout, "%0.6f\n", R2(i));
  endfor
  fprintf(fout, "\n");
  for i = 1:N
    for k = 1:N
      if R3(i) == R2(k)
        j = k;
        break;
      endif
    endfor
    fprintf(fout, "%d %d ", i, j)
    fprintf(fout, "%0.6f\n", Apartenenta(R3(i), val1, val2));
  endfor
  
  fclose(fout);
endfunction