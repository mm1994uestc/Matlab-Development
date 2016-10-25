%%ROI Testing
close all;
clear all;
clc;
I=imread('Test.png');
I=rgb2gray(I);
I=I(1:210,1:210);
[m,n]=size(I);
I_BW=I;
for Row1=1:m
    for Clo1=1:n
        if I(Row1,Clo1)>190
            I_BW(Row1,Clo1)=255;
        else
            I_BW(Row1,Clo1)=0;
        end
    end
end
imshow(I)
%figure,imhist(I)
figure,imshow(I_BW)
I_BW_morph=bwmorph(I_BW,'erod',0.8);%形态学腐蚀原理
Filter=[-1,-1,-1;-1,8,-1;-1,-1,-1];%高通滤波器，挖出二值图像的边界像素
I_Filter=imfilter(I_BW_morph,Filter);%使用滤波的方法得到的图像的边界部分是白色的，边界有变化所以经过高通滤波器后为白色
figure,imshow(I_Filter)
I_Edge=I_Filter;
I_Edge(:,2)=0;%由于采用的是滤波器的方法来实现边缘的提取，在图像的边界部分会出现颜色的变化，因此我们需要把图像边缘的部分置为0
I_Edge(:,n-1)=0;
I_Edge(2,:)=0;
I_Edge(m-1,:)=0;
figure,imshow(I_Edge)
I_Edge=uint8(I_Edge);%图像uint8化
ROI_Buffer=uint8(zeros(m,n,5));%四个模板缓存区域
C_Shape=zeros(4,1);
Label=0;

for Row2=1:m
    for Clo2=1:n
        if I_Edge(Row2,Clo2)==1
            Label=Label+1
            [ROI_Buffer(:,:,Label),C_Shape(Label,1)]=Pixel_Search(I_Edge,Row2,Clo2,m,n);%把当前的数据赋给模板
            figure,imshow(255*ROI_Buffer(:,:,Label));%显示所得到的对应标号为Label的图像边界，这里需要注意的问题是：由图像的色彩等级不同，因此得到的图像可能全是黑色，需要乘以255（uint8）
            C_Shape(Label,1)
            I_Edge=I_Edge-ROI_Buffer(:,:,Label);%去除原图中已经提取完成的部分
        end
    end
end