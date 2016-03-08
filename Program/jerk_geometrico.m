function J = jerk_geometrico(R,T)
d = size(R,3);

Omega = zeros(3,3,d-1);
for k = 2:d,
 Omega(:,:,k-1)= (1/(2*T))*( R(:,:,k-1)'* R(:,:,k) - R(:,:,k)'* R(:,:,k-1) );
end
%{
figure;
subplot(3,2,1); plot(T*(1:d-1),squeeze(Omega(1,2,:)),'LineWidth',2); xlabel('Time','FontSize',14,'Interpreter','LaTeX');
                ylabel('$$\omega_{12}$$','FontSize',14,'Interpreter','LaTeX'); xlim([T (d-1)*T]);
subplot(3,2,3); plot(T*(1:d-1),squeeze(Omega(1,3,:)),'LineWidth',2); xlabel('Time','FontSize',14,'Interpreter','LaTeX');
                ylabel('$$\omega_{13}$$','FontSize',14,'Interpreter','LaTeX'); xlim([T (d-1)*T]);
subplot(3,2,5); plot(T*(1:d-1),squeeze(Omega(2,3,:)),'LineWidth',2); xlabel('Time','FontSize',14,'Interpreter','LaTeX');
                ylabel('$$\omega_{23}$$','FontSize',14,'Interpreter','LaTeX'); xlim([T (d-1)*T]);               
subplot(3,2,[2 4 6]); plot3(squeeze(Omega(1,2,:)),squeeze(Omega(1,3,:)),squeeze(Omega(2,3,:)),'LineWidth',2);
                      xlabel('$$\omega_{12}$$','FontSize',14,'Interpreter','LaTeX');
                      ylabel('$$\omega_{13}$$','FontSize',14,'Interpreter','LaTeX');
                      zlabel('$$\omega_{23}$$','FontSize',14,'Interpreter','LaTeX');
%}
Omegap = zeros(3,3,d-2);
for k = 2:d-1,
 Omegap(:,:,k-1) = (1/T)*( Omega(:,:,k) - Omega(:,:,k-1) );
end
 
Omegapp = zeros(3,3,d-3);
for k = 2:d-2;
    Omegapp(:,:,k-1) = (1/T)*( Omegap(:,:,k) - Omegap(:,:,k-1) );
end

Jerk = zeros(3,3,d-2); %geometric jerk
for k = 1:d-3,
    Jerk(:,:,k)= (1/2)*R(:,:,k)*( Omega(:,:,k)*Omegap(:,:,k) - Omegap(:,:,k)*Omega(:,:,k) ) + R(:,:,k)* Omegapp(:,:,k);
end

%scalar jerk
J = 0;
for k=1:d-3,
    J = J + T*norm(Jerk(:,:,k),'fro')^2;
end