% Main program for computation of Jerk Coefficent
% Developed by Andrea Civita, Simone Fiori and Giuseppe Romani
% (Università Politecnica delle Marche, October 2015) 
% Reset dell'ambiente di lavoro
clear all;
clc;
path=GetPath();
disp('Sto calcolando i Jerk....')
risultati=zeros(6,1);
for k=1:6
load(path(k,:));
% Dichiarazione e inizializzazione dei dati e matrici
L = size(dati,2); %Il numero di colonne della matrice è il numero dei campionamenti effettuati. 
R = zeros(3,3,L); %Inizializzo la matrice R di dimensione 3x3xC
T = 1/10;
Omega = zeros(3,3,L); %Inizializzo la matrice Omega
jerk=0;
%Inizio della procedura di calcolo
%Questo ciclo crea una matrice di rotazione (R) per ogni istante
if k<7
R = Rotation(dati,L);
end
%Elimino le variabili usate per calcolare la matrice di rotazione.
jerk = jerk_euclideo(R,T);
risultati(k,1)=jerk;
end
clearvars -except risultati
clc;
tabella(risultati);
