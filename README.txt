###############################################################################
############################# README - Tema_1 MN ##############################
###############################################################################

Tema a fost realizata pornind de la scheletul dat, la care am adaugat o functie
pentru rezolvarea unui SST. In continuare vor fi detaliate toate functiile in
parte.

################################ Iterative.m ##################################

Datele au fost citite din fisier folosid functia 'getl', urmand sa fie folosita
functia 'str2num' pentru conversia tipului de data. Implementarea algoritmului
s-a realizat conform pasilor descrisi in pagina de Wikipedia: calculul matricei
de adiacenta 'A', matricele 'L' si 'M', apoi calculul iterativ (conform
formulei) pana la depasirea pragului 'eps'.

#################################### SST.m ####################################

Functie ce rezolva si returneaza solutia unui sistem superior triunghiular. S-a
apelat in cadrul PR_Inv.m pentru rezolvarea fiecaruia dintre cele 'n' sisteme.
Implementarea a fost realizata conform formulei si descrierii din Laboratroul
numarul 2.

################################## PR_Inv.m ###################################

Inversa matricei primite ca parametru este calculata conform metodei descrise
in cerinta - rezolvarea celor 'n' sisteme. Pentru rezolvarea sistemelor am
descompus matricea in Q si R prin algoritmul Gram-Schmidt, cu scopul de a 
rezolva sisteme de tip SST. Factorizarea Gram-Schmidt a fost prealuata din
Laboratorul numarul 3.

################################# Algebraic.m #################################

Citirea si completarea datelor necesare este realizata prin aceeasi maniera ca
in functia 'Iterative.m". Diferenta apare in calculul vectorului de PakeRanks.
Se apeleaza 'PR_Inv.m' pentru calculul inversei 'B' conform metodei descrise pe
pagina de Wikipedia, apoi urmeaza calculul lui 'R' intr-un singur pas.

################################ Apartenenta.m ################################

Functia calculeaza cele 2 valori 'a' si 'b', apoi identifica ramura pe care se
afla parametrul 'x' pentru a calcula rezultatul in 'y'. 'a' si 'b' se afla
prin aplicarea conditiilor de continuitate si rezolvarea unui sistem de 2 ec.
cu 2 necunoscute: u(val1) =  0 ; u(val2) = 1.

################################# PageRank.m ##################################

'PageRank.m' apeleaza functiile ce calculeaza PageRanks. Pentru gradul de
apartenenta se sorteaza 'R2' folosind functia 'sort' descrescator. In cadrul
afisarii se apeleaza functia 'Apartenenta.m', iar indicele din vectorul
nesortat se obtine printr-o parcurgere a vectorului 'R2', cautand pagina cu
PageRank-ul de interes. Toate afisarile s-au realizat folosind 'fprintf', cu
indicatorul '%0.6f' pentru numerele reale - pageranks.

###############################################################################
Facultatea de Automatica si Calculatoare - Anul 1 2021-2022 - Grupa 312CCa
PETCU Andrei - Metode Numerice - TEMA 1
###############################################################################