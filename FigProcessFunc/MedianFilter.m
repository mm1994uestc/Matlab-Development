clear all;clc
I=imread('rice.png');
[m,n]=size(I);
Pic_Big=zeros(m+2,n+2);
Pic_Big(2:m+1,2:n+1)=I;
Pic_Big=uint8(Pic_Big);
J=imnoise(Pic_Big,'salt & pepper');
J_Process=J;
FIFO=zeros(1,9);
for Row=2:m+1
    for Clo=2:n+1
        FIFO(1:3)=J(Row-1,Clo-1:Clo+1);
        FIFO(4:6)=J(Row,Clo-1:Clo+1);
        FIFO(7:9)=J(Row+1,Clo-1:Clo+1);
        J_Process(Row,Clo)=median(FIFO);
    end
end
J_Process_Edge=J_Process(2:m+1,2:n+1);
subplot(1,2,1)
imshow(J)
subplot(1,2,2)
imshow(J_Process_Edge)