function jerk = jerk_euclideo(R,T)
C=T;
L=size(R,3);
Z = zeros(3,L); %Inizializzo il vettore Z
ZA=zeros(3,L-1); %Inizializzo il vettore ZA (Derivata 1 di Z)
ZJ=zeros(3,L-2); %Inizializzo il vettore ZJ (Derivata 2 di Z)
VJ=zeros(1,L-2);
jerk=0;

%Questo script crea la matrice Omega e inserisce in un vettore gli elementi
%(1,2)(1,3)(2,3)
for k=2:L,
 %Omega(:,:,k) = (1/(2*T))*(R(:,:,k-1)'*R(:,:,k)-R(:,:,k)'*R(:,:,k-1)); % calcolo OMEGA
 Omega(:,:,k) = (1/T)*logm(R(:,:,k-1)'*R(:,:,k));
 Z(:,k-1) = [Omega(1,2,k),Omega(1,3,k),Omega(2,3,k)]; % Inserisco gli elementi di omega all'interno del vettore Z
end

%Questo ciclo genera la derivata del vettore Z.

for k=2:L-1,
    ZA(:,k-1)=(Z(:,k) - Z(:,k-1))/T;
end

%Questo ciclo genera la derivata seconda del vettore Z.
%Questo ciclo calcola la norma^2 di ogni vettore e la aggiunge alla
%variabile jerk. La somma ottenuta è il coefficente di jerk

for k=2:L-2,
    ZJ(:,k-1)=(ZA(:,k) - ZA(:,k-1))/T; %Inserisce la derivata nel vettore. Il vettore partirà dall'indice K=1 (k-1)
    VJ(:,k-1)=power(norm(ZJ(:,k-1)),2);
    jerk=jerk+C*power(norm(ZJ(:,k-1)),2); %Allo stesso modo, calcolo subito la norma al quadrato del vettore e lo sommo al jerk
    VJ(:,k-1)=jerk;
end

