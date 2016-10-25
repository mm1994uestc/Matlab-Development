clear;%清理matlab的内存变量
close all;%清除所有的图片框
clf;%清除所有的figure
clc;%清除Commond 空间

%进行log指数变换
c=0.2;
x=0:0.1:255;
y=c*log(1+x);
I=double(imread('rice.png'));%图像的处理过程，一般需要采用double型的数据处理
Log=c*log(1+I);
subplot(1,2,1)
imshow(uint8(I))
subplot(1,2,2)
imhist(uint8(I))
figure,
subplot(1,2,1)
title('LogTransform');
imshow(Log)
subplot(1,2,2)%在使用xlabel ylabel的时候需要在绘图的后面执行
plot(y,'r')
xlabel('x')
ylabel('y')
%figure,imshow(uint8(I))
%figure,imshow(Log)

%进行幂指数变换
l=0.005;%取值时，你需要注意的是 你如果了平方，那么需要想好如何处理图像的系数，亮度相乘的数量级变换是*255，所以扩大了100倍
Exp=l*(I.^2);
y=l*(x.^2);
figure,
subplot(1,2,1);
title('ExpTransform');
imshow(uint8(Exp))
subplot(1,2,2)
plot(y,'b')
xlabel('x')
ylabel('y')
% xlim([0 255])