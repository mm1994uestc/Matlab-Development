%%edgedetect
%method one
clear;clc
I=imread('rice.png');
Aver_Matrix=ones(3)/9;
HPas_Matrix=[-1,-1,-1;-1,8,-1;-1,-1,-1];
I_AverProcess=imfilter(I,Aver_Matrix);
I_HPasProcess=imfilter(I,HPas_Matrix);
EdgebyAver=2*I-I_AverProcess;
EdgebyHPas=I+I_HPasProcess;
subplot(2,2,1)
imshow(I_AverProcess)
subplot(2,2,2)
imshow(EdgebyAver)
subplot(2,2,3)
imshow(I_HPasProcess)
subplot(2,2,4)
imshow(EdgebyHPas)