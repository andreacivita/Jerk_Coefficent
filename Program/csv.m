filename='cammino.csv';
M = csvread(filename);
%n= size(M,1); %Usare questa istruzione per singoli file csv da convertire.
n=600; %Modificare ed usare questa istruzione se occore avere più matrici con lo stesso campionamento. 
somma=0;
Matrix= zeros (n,3);
Accmat=zeros(n,3);
%Questo script prende soltanto i dati dell'accellerometro

for k=1:n
     Accmat(k,1)=M(k,3);
     Accmat(k,2)=M(k,4);
     Accmat(k,3)=M(k,5);
end

dati=zeros(3,n);
dati=Accmat';
clearvars -except dati
save ('../Dati/Csv'); %Specificare il nome del file da salvare. Verrà caricato usando load nomefile;
n=size(dati,2); %recupero il numero di colonne.
g1=1*dati(1,1:n); 
g2=1*dati(2,1:n);
g3=1*dati(3,1:n);

hold on
subplot(3,1,1); plot(g1,'r');   title('Dati da File'); grid;   xlabel('Istanti'); ylabel('Asse X');
subplot(3,1,2); plot(g2,'g');   grid;   xlabel('Istanti'); ylabel('Asse Y');
subplot(3,1,3); plot(g3,'b');   grid;   xlabel('Istanti'); ylabel('Asse Z');