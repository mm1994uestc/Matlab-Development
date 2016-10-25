%图像二值化
close all;
clear;
clc;
I=imread('rice.png');
thresh=graythresh(I);%自动确定二值化阈值
I2=im2bw(I,thresh);%对图像自动二值化即可
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(I2)
figure,imshow(I2)
BW_Dilate=bwmorph(I2,'erode',1);%膨胀算法dilate 腐蚀算法erode
figure,imshow(BW_Dilate)
%counter detect
% HPas_Matrix=[-1,-1,-1;-1,8,-1;-1,-1,-1];
% I_HPasProcess=imfilter(BW_Dilate,HPas_Matrix);
% figure,imshow(I_HPasProcess)
I_Edge=edge(BW_Dilate,'canny');
figure,imshow(I_Edge)