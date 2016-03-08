close all;
clear all;
clc;
%Menu di scelta del dataset
risp=menu('Scegli il database da caricare','Esperto','Intermedio','Inesperto');
if risp==1
    risp1=menu('Scegli la prova','Facile','Difficile');
    if risp1==1
        path=strcat('../Dati/Esperto/Facile/prova.mat');
        Stringa= 'Esperto | Prova Facile';
    else
         path=strcat('../Dati/Esperto/Difficile/prova.mat');
         Stringa= 'Esperto | Prova Difficile';
    end
end
if risp==2
    risp1=menu('Scegli la prova','Facile','Difficile');
    if risp1==1
        path=strcat('../Dati/Medio/Facile/prova.mat');
        Stringa= 'Intermedio | Prova Facile';
    else
         path=strcat('../Dati/Medio/Difficile/prova.mat');
         Stringa= 'Intermedio | Prova Difficile';
    end
end
if risp==3
    risp1=menu('Scegli la prova','Facile','Difficile');
    if risp1==1
        path=strcat('../Dati/Inesperto/Facile/prova.mat');
        Stringa= 'Inesperto | Prova Facile';
    else
         path=strcat('../Dati/Inesperto/Difficile/prova.mat');
         Stringa= 'Inesperto | Prova Difficile';
    end
end
clc;
load(path);
C=size(dati,2); %recupero il numero di colonne.
R=Rotation(dati,C);
Z = zeros(3,C); %Inizializzo il vettore Z
T = 1/10;
for k=2:C,
 %Omega(:,:,k) = (1/(2*T))*(R(:,:,k-1)'*R(:,:,k)-R(:,:,k)'*R(:,:,k-1)); % calcolo OMEGA
 Omega(:,:,k) = (1/T)*logm(R(:,:,k-1)'*R(:,:,k));
 Z(:,k-1) = [Omega(1,2,k),Omega(1,3,k),Omega(2,3,k)]; % Inserisco gli elementi di omega all'interno del vettore Z
end
g1=1*dati(1,1:C); 
%g1=unwrap(g1*pi/180)*180/pi;
g2=1*Z(1,1:C); 
%g2=unwrap(g2*pi/180)*180/pi;
%g3=1*dati(3,1:n);
subplot(1,1,1);plot(g1,g2,'b'); title(['Movimento di ',Stringa]); grid;   xlabel('Posizione asse X'); ylabel('Velocità asse X');