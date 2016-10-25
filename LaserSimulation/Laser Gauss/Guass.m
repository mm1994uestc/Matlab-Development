% z=linspace(-632,632);
% f=50;
% Rz=z+f^2./z;
% hold on,plot(z,Rz)
% Rz=abs(Rz);
% figure,plot(z,Rz,'r')
% 
% z=linspace(-632,632);
% W0=5;
% Wz=W0*sqrt(1+(z.^2./f^2));
% figure,plot(z,Wz)

L=632.8;
z=L;
BC=632.8e-6;
C=0.1;
f=L/2;
W0=sqrt(L*BC/2/pi);
Wz=W0*sqrt(1+(z/f)^2);
[x,y]=meshgrid(-3:0.3:3,-3:0.3:3);
Z=C*W0/Wz*exp((x.^2+y.^2)/Wz^2);
mesh(x,y,Z)
%clear