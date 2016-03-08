function [d,A,J] = jerk_cartesiano(R,T)
L=size(R,3);
z = zeros(3,L-1); %Inizializzo il vettore z
%Questo script crea la matrice Omega e inserisce in un vettore gli elementi (1,2)(1,3)(2,3)
for k=2:L,
 Omega = (1/T)*real(logm(R(:,:,k-1)'*R(:,:,k)));
 z(:,k-1) = [Omega(1,2),Omega(1,3),Omega(2,3)]; % Inserisco gli elementi di omega all'interno del vettore z
end
%Questo ciclo genera la derivata del vettore z e il jerk cartesiano
a = (1/T)*diff(z,1,2);
je = (1/T)*diff(a,1,2);
% Calcolo della distanza totale percorsa e della accelerazione accumulata
d = T*sum(sqrt(sum(z.^2,1)));
% Calcolo dell'accelerazione totale accumulata
Ca = (L-2)*T/d;
A = Ca*T*sum(sqrt(sum(a.^2,1)));
% Calcolo del jerk totale accumulato
Cj = (L-3)^2*T^2/d;
J = Cj*T*sum(sqrt(sum(je.^2,1)));


