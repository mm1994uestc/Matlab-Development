%任务1的程序%
R1=500;R2=600;L=700;
S=[5;0];%初始的状态
A=1-2*L/R2;
B=2*L*(1-L/R2);
C=-2/R1-2/R2+4*L/R1*R2;
D=-2*L/R1+(1-2*L/R1)*(1-2*L/R2);
T=[A,B;C,D];
n=10;
X=linspace(0,L);
for Count=1:n
    S1=[1,0;-2/R2,1]*[1,L;0,1]*S;
    Y=tan(S(2))*X+S(1);
    hold on,plot(X,Y,'g')
    Y=tan(S1(2))*X+S1(1);
    hold on,plot(L-X,Y,'r')
    S=[1,0;-2/R1,1]*[1,L;0,1]*[1,0;-2/R2,1]*[1,L;0,1]*S;
end
%任务2的程序%
clear 
syms LL; 
R=1000;
F=50;L=800; 
TL=[1 L;0 1]; 
TM=[1 0;-1/F 1]; 
TR2=[1 0;0 1]; 
TR1=[1 0;-2/R 1]; 
TL1=[1 LL;0 1]; 
TRR=TR1*TL*TM*TL1*TR2*TL1*TM*TL; 
G=(TRR(1)+TRR(4))/2; 
X1=solve(G-1); 
X2=solve(G+1); 
disp(['距离L1在  ',char(X2),'<L1<',char(X1),'  内腔是稳定的'])

S=[5;0];
L=800;
L1=50;
R=1000;
F=50;
TL=[1 L;0 1]; 
TM=[1 0;-1/F 1]; 
TR2=[1 0;0 1]; 
TR1=[1 0;-2/R 1]; 
TL1=[1 L1;0 1];%qustion
X=linspace(0,800);
X1=linspace(800,850);
figure('name','任务2');
n=10;
for Count=1:n
    S1=TM*TL*S;
    Y=tan(S(2))*X+S(1);
    hold on,plot(X,Y,'b')
    Y=tan(S1(2))*(X1-800)+S1(1);
    hold on,plot(X1,Y,'b')
    S2=TR2*TL1*S1;
    Y=tan(S2(2))*(X1-800)+S2(1);
    hold on,plot(1650-X1,Y,'r')
    S3=TM*TL1*S2;
    Y=tan(S3(2))*X+S3(1);
    hold on,plot(800-X,Y,'r')
    S=TR1*TL*TM*TL1*TR2*TL1*TM*TL*S;
end


clear
figure('name','自再现光束')
F=50;l1=50;wavelength=0.0005; 
L=800;R=1000; 
Tl1=[1,l1; 0, 1];Tf=[1 0;-1/F,1];TL=[1 L;0 1];Tr=[1 0;-2/R 1]; T=Tr*TL*Tf*Tl1*Tl1*Tf*TL; S=(T(1,1)+T(2,2))/2 
q1=(T(1,1)-T(2,2)+2i*sqrt(1-(T(1,1)+T(2,2))^2/4))/T(2,1)/2   
z0=real(q1); 
f1=imag(q1); 
w1=sqrt(f1*wavelength/pi);  
z1=0:1:L; 
wz1p=w1*sqrt(1+((z1+z0)/f1).^2); wz1n=-w1*sqrt(1+((z1+z0)/f1).^2); plot(z1,wz1p,z1,wz1n); hold on   
TLf=Tf*TL; 
q2=(TLf(1,1)*q1+TLf(1,2))/(TLf(2,1)*q1+TLf(2,2)); z02=real(q2); 
f2=imag(q2); 
w02=sqrt(f2*wavelength/pi); 
z2=L:1:L+l1; 
wz2p=w02*sqrt(1+((z2-L+z02)/f2).^2); wz2n=-w02*sqrt(1+((z2-L+z02)/f2).^2); plot(z2,wz2p,z2,wz2n); hold on 
  
q3=(Tl1(1,1)*q2+Tl1(1,2))/(Tl1(2,1)*q2+Tl1(2,2)); z03=-real(q3); 
f3=imag(q3); 
w03=sqrt(f3*wavelength/pi); 
z3=(l1+L):-1:L; 
wz3p=w03*sqrt(1+((z3-l1-L+z03)/f3).^2)-0.01; wz3n=-w03*sqrt(1+((z3-l1-L+z03)/f3).^2)+0.01; plot(z3,wz3p,'r',z3,wz3n,'r'); hold on  
Tfl1=Tf*Tl1; 
q4=(Tfl1(1,1)*q3+Tfl1(1,2))/(Tfl1(2,1)*q3+Tfl1(2,2)); z04=-real(q4); f4=imag(q4); 
w04=sqrt(f4*wavelength/pi); z4=L:-1:0; 
wz4p=w04*sqrt(1+((z4-L+z04)/f4).^2)-0.01; wz4n=-w04*sqrt(1+((z4-L+z04)/f4).^2)+0.01; plot(z4,wz4p,'r',z4,wz4n,'r'); hold on 
q5=(TL(1,1)*q4+TL(1,2))/(TL(2,1)*q4+TL(2,2)); 
title('自在现高斯光束的光斑半径') 