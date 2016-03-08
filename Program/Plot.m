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
n=size(dati,2); %recupero il numero di colonne.

%Creo il grafico
g1=1*dati(1,1:n); g1=unwrap(g1*pi/180)*180/pi;
g2=1*dati(2,1:n); g2=unwrap(g2*pi/180)*180/pi;
g3=1*dati(3,1:n); g3=unwrap(g3*pi/180)*180/pi;

Stringa=['Dati da ', Stringa];
hold on
subplot(3,1,1); plot(g1,'r');   title(Stringa); grid;   xlabel('Istanti'); ylabel('Asse X');
subplot(3,1,2); plot(g2,'g');   grid;   xlabel('Istanti'); ylabel('Asse Y');
subplot(3,1,3); plot(g3,'b');   grid;   xlabel('Istanti'); ylabel('Asse Z');