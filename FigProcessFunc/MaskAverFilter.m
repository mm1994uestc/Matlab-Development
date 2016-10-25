clear all;clc
I=imread('rice.png');
[m,n]=size(I);
Pic_Big=zeros(m+4,n+4);
Pic_Big(3:m+2,3:n+2)=I;
z=double(Pic_Big);
zz=z;
Mask=ones(3)/9;
for Row=3:m+2
    for Clo=3:n+2
        result=z(Row:Row+2,Clo:Clo+2).*Mask;
        grade=result(1,1)+result(1,2)+result(1,3)+result(2,1)+result(2,2)+result(2,3)+result(3,1)+result(3,2)+result(3,3);
        zz(Row,Clo)=grade;
    end
end
Pic=zz(3:m+2,3:n+2);
subplot(1,2,1)
imshow(I);
subplot(1,2,2)
imshow(mat2gray(Pic))