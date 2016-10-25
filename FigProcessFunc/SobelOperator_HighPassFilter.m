%Sobel operator
clear all;clc
I=imread('rice.png');%读取一张图片
Sobel_Filter=[-1,-2,-1;0,0,0;1,2,1];%这个是索贝尔滤波算子
I_Process=imfilter(I,Sobel_Filter);%采用滤波函数imfilter
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(I_Process)