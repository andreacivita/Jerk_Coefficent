function R  = Rotation(dati,L)
for k=1:L,
 kRoll=dati(1,k); %rotazione lungo x
 kPitch=dati(2,k); %rotazione lungo y 
 kYaw=dati(3,k);%rotazione lungo z
 
 mRoll=rotx(kRoll);      %x
 mPitch=roty(kPitch);     %  y
 mYaw=rotz(kYaw);        % z

 R(:,:,k)=mYaw*mPitch*mRoll; %matrice di rotazione definitiva
end

end

