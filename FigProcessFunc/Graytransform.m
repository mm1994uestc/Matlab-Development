clear;%����matlab���ڴ����
close all;%������е�ͼƬ��
clf;%������е�figure
clc;%���Commond �ռ�

%����logָ���任
c=0.2;
x=0:0.1:255;
y=c*log(1+x);
I=double(imread('rice.png'));%ͼ��Ĵ�����̣�һ����Ҫ����double�͵����ݴ���
Log=c*log(1+I);
subplot(1,2,1)
imshow(uint8(I))
subplot(1,2,2)
imhist(uint8(I))
figure,
subplot(1,2,1)
title('LogTransform');
imshow(Log)
subplot(1,2,2)%��ʹ��xlabel ylabel��ʱ����Ҫ�ڻ�ͼ�ĺ���ִ��
plot(y,'r')
xlabel('x')
ylabel('y')
%figure,imshow(uint8(I))
%figure,imshow(Log)

%������ָ���任
l=0.005;%ȡֵʱ������Ҫע����� �������ƽ������ô��Ҫ�����δ���ͼ���ϵ����������˵��������任��*255������������100��
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