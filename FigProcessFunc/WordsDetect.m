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
Filter=[1,1,1;1,1,1;1,1,1];%��ͨ�˲������ڳ���ֵͼ��ı߽�����
BW_Erode=bwmorph(I_BW,'erod',0.3);
I_Filter=imfilter(BW_Erode,Filter);%ʹ���˲��ķ����õ���ͼ��ı߽粿���ǰ�ɫ�ģ��߽��б仯���Ծ�����ͨ�˲�����Ϊ��ɫ
imshow(I)
figure,imshow(I_Filter)