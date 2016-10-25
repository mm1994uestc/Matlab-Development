close all;
clear all;
clc;
I=imread('C:\Users\lenovo.Lenovo-PC\Desktop\Test1.jpg');
I=rgb2gray(I);
I=I(1:1000,1:1000);
[m,n]=size(I);
I_BW=I;
I_P=LocalDensitySeg(I_BW,3,0.2);
for Row1=1:m
    for Clo1=1:n
        if I(Row1,Clo1)>150
            I_BW(Row1,Clo1)=255;
        else
            I_BW(Row1,Clo1)=0;
        end
    end
end
Filter=[1,1,1;1,1,1;1,1,1];%高通滤波器，挖出二值图像的边界像素
BW_Erode=bwmorph(I_BW,'erod',0.3);
I_Filter=imfilter(BW_Erode,Filter);%使用滤波的方法得到的图像的边界部分是白色的，边界有变化所以经过高通滤波器后为白色
imshow(I)
figure,imshow(I_Filter)