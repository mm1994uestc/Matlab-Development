B=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER0\Fire (1).jpg');
S=imread('C:\Users\lenovo.Lenovo-PC\Pictures\Screenshots\009.jpg');
[m,n]=size(B);
[r,c]=size(S);
a=0.3;
b=0.7;
S=S(100:300,200:400,:);
for Row=120:320
    for Clo=260:460
        B(Row,Clo)=floor(a*B(Row,Clo))+floor(b*S(Row-119,Clo-259));
    end
end
% Temp=B(100:300,200:400,:);
% Temp1=floor(a*Temp)+floor(b*S);
% B(100:300,200:400,:)=Temp1;
figure,imshow(S)
figure,imshow(B)