
close all;
clear all;
risp=menu('Scegli il database da caricare','Cammino','Corsa','Salti');
if risp==1
    path=strcat('../Dati/Cammino.mat');
    Stringa= 'Cammino';
end
if risp==2
    path=strcat('../Dati/Corsa.mat');
    Stringa= 'Corsa';
end
if risp==3
    path=strcat('../Dati/Salti.mat');
    Stringa= 'Salti';
end
load(path);
clc;
n=size(dati,2);
%dati(2,1:n)=1;
%dati(3,1:n)=1;
fx=[0 2 2 2.2 2 2 0; 
    0 0 -0.1 0 0.1 0 0;
    0 0 0 0 0 0 0];

%fy=[0 0 0.1 0 -0.1 0 0;0 2 2 2.2 2 2 0;0 0 0 0 0 0 0 ];
[X,Y,Z] = sphere(30);

fy(1,:)=X(:); fy(2,:)=Y(:); fy(3,:)=Z(:);

fz=[0 0 0.1 0 -0.1 0 0;0 0 0 0 0 0 0 ; 0 2 2 2.2 2 2 0];

fx1=fx;
fy1=fy;
fz1=fz;


for k=1:size(dati,2),
	
	kRoll=dati(1,k);  %rotazione lungo x
    
	kPitch=dati(2,k); %rotazione lungo y 
     
	kYaw=dati(3,k);%rotazione lungo z
     

	mRoll=rotx(kRoll);      %x
	mPitch=roty(kPitch);     %  y
	mYaw=rotz(kYaw);        % z
	
	
	M=mYaw*mPitch*mRoll; %matrice di rotazione definitiva

	%animazione
	fx1=M*fx;
    	fy1=M*fy;
    	fz1=M*fz;
	
	%vettore asse x
    	plot3(fx1(1,:),fx1(2,:),fx1(3,:),'k');
    	axis([-2 2 -2 2 -2 2]);
        hold on;
    	%vettore asse y
     	plot3(fy1(1,:),fy1(2,:),fy1(3,:),'r');
        hold on;
    	%vettore asse z
     	plot3(fz1(1,:),fz1(2,:),fz1(3,:),'b');
        hold off;
    
   	%delay
    	pause(0.00000001);
end
	
