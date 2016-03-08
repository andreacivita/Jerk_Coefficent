%Reset ambiente Matlab
instrreset
clear
clc
close all;
clear all;
%variabili
limite=9000; %limite di righe da scansionare; colonne ottenute= (limite/300); sopra a 14599 l'app si blocca
%Creo nuovo oggetto UDP
%0.0.0.0 = qualunque ip che invia dati, 1710 è la porta in cui i dati
%vengono trasmessi. È possibile deciderne una arbitrariamente
UDPComIn=udp('0.0.0.0','LocalPort',1710); 
set(UDPComIn,'DatagramTerminateMode','off', 'InputBufferSize', limite) %Imposto la dimensione del buffer. 
cond=true;

while 1, 
    fopen(UDPComIn); %apro la connessione
    csvdata=fscanf(UDPComIn); %ricevo i dati
    scandata=textscan(csvdata,'%s', limite , 'Delimiter',', ,#'); %vado a leggere la stringa ricevuta. %s significa che i dati sono stringhe, 45 che riceverò al massimo 45 dati. ' ' significa che i dati sono divisi da uno spazio
    scan=scandata{1,1}; %inserisco il risultato di scandata in una variabile. NB: scan è di tipo CELL
    %scandata=textscan(csvdata,'%s %s %f %f %f %s %f %f %f %s %f %f %f ', 'Delimiter','\n');
    %data=[scandata{4},scandata{5},scandata{6}];
    C = size(csvdata,2);
    if C==limite
        break;
    end
    clc
    fclose(UDPComIn);
end
 scan=scan(~cellfun('isempty',scan)); %elimino le righe vuote;  
 C=size(scan,1);
apparray=zeros(C,1); %creo un vettore per ospitare i dati
for p=1:C
    a=4; %memorizzo 4 nella variabile a per assegnarle il valore DOUBLE. Senza questa istrzione, a sarebbe CELL
    a=scan{p}; %memorizzo dentro a il valore contenuto in scan
    a=str2num(a); %converto a in un double
    apparray(p)=a; %memorizzo a nell'array
end
dati=vec2mat(apparray,3); %creo una matrice partendo dall'array. ogni riga della matrice è composta da 3 righe dell'array
dati=dati';
clearvars -except dati; %elimino tutte le variabili eccetto la matrice dei dati
save('../Dati/Udp.mat'); %salvo i dati
% AGGIUNGERE QUESTE RIGHE SE SI VUOLE MOSTRARE A VIDEO IL GRAFICO OTTENUTO
%Creo il grafico
n=size(dati,2); %recupero il numero di colonne.
g1=1*dati(1,1:n); 
g2=1*dati(2,1:n);
g3=1*dati(3,1:n);

hold on
subplot(3,1,1); plot(g1,'r');   title('Dati da Udp'); grid;   xlabel('Istanti'); ylabel('Asse X');
subplot(3,1,2); plot(g2,'g');   grid;   xlabel('Istanti'); ylabel('Asse Y');
subplot(3,1,3); plot(g3,'b');   grid;   xlabel('Istanti'); ylabel('Asse Z');
%CodeEnd----------------------------------------------------------

