%Sobel operator
clear all;clc
I=imread('rice.png');%��ȡһ��ͼƬ
Sobel_Filter=[-1,-2,-1;0,0,0;1,2,1];%������������˲�����
I_Process=imfilter(I,Sobel_Filter);%�����˲�����imfilter
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(I_Process)