% Programma per il calcolo del jerk cartesiano sui dati della palestra 

clear all; close all; clc
NomeFile = {'Inesperto/Facile','Medio/Facile','Esperto/Facile','Inesperto/Difficile','Medio/Difficile','Esperto/Difficile'};
NumSegnali = size(NomeFile,2); 
T = 0.021; %Valore reale
Results = zeros(NumSegnali,3); 
for SignalNum = 1:NumSegnali,
 load([NomeFile{SignalNum} '/prova']);
 dati = dati*pi/180; % Converts to radians
 [d,A,J] = jerk_cartesiano(Rotation(dati),T);
 Results(SignalNum,:) = [d,A,J]; 
end
% Prints a table to display the results
printmat(Results,'Risultati','Inesp/Facile Medio/Facile Esperto/Facile Inesp/Diffic Medio/Diffic Esperto/Diffic','Distanza Acceler. Jerk')


         
