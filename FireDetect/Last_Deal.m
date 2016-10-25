%读取图像 %
clear all;
close all;
clc;
m1=270;%图像的大小 big 480*720(PIC_BUFFER2)  small 270*480(PIC_BUFFER1)
n1=480;
tic%T1=clock;%计时开始
FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER1\Fire (1).jpg');
FPS2=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER1\Fire (2).jpg');
% FPS3=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (3).jpg');
% FPS4=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (4).jpg');
%二值图像%
%imwrite(I,'image.jpg');%用MATLAB转换图片的格式方法，后缀名不同，输出格式不同
[Fire1,Fire1_Iave]=FZoneExFun(FPS1);
[Fire2,Fire2_Iave]=FZoneExFun(FPS2);
% [Fire3,Fire3_Iave]=FZoneExFun(FPS3);
% [Fire4,Fire4_Iave]=FZoneExFun(FPS4);
%[S,Boundary,Num]=ShapeClassification(Fire1);


%灰度图像%
Gray1=rgb2gray(FPS1);
Gray2=rgb2gray(FPS2);
% Gray3=rgb2gray(FPS3);
% Gray4=rgb2gray(FPS4);

%显示图像边缘
% Fire1_Edge=edge(Fire1);%会出现断点，边界图形不封闭
% Fire2_Edge=edge(Fire2);
% Fire3_Edge=edge(Fire3);
% Fire4_Edge=edge(Fire4);
Fire1_Edge=bwperim(Fire1,8);%二维二值图像的边界提取函数bwperim(BW,N),N为边界使用的邻域，取2为2维4邻域  8为2维8邻域，6为3维6邻域，18为3维18邻域
Fire2_Edge=bwperim(Fire2,8);
% Fire3_Edge=bwperim(Fire3,8);
% Fire4_Edge=bwperim(Fire4,8);
%显示图像%
% figure,
% Display(FPS1,Gray1,Fire1,Fire1_Edge,1)%原图像 灰度图像 二值图像 二值边缘提取 排列位置
% Fire1_Iave;%还需要继续完善Gth的数据拟合曲线，亮度和Gth相关结合需要更多的样本
% Display(FPS2,Gray2,Fire2,Fire2_Edge,6)
% Fire2_Iave;
% Display(FPS3,Gray3,Fire3,Fire3_Edge,11)
% Fire3_Iave;
% Display(FPS4,Gray4,Fire4,Fire4_Edge,16)
% Fire4_Iave;
% figure, imshow(Fire3_Edge) 
% figure, imshow(Fire4_Edge)
% subplot(1,3,1)
% imshow(Fire1_Edge)
% subplot(1,3,2)
% imshow(Fire2_Edge)
% subplot(1,3,3)
% Frame_Sub=Fire2_Edge-Fire1_Edge;%帧差法
% figure,imshow(Frame_Sub)
figure, imshow(Fire1_Edge)
figure, imshow(Fire2_Edge)

%ROI区域自动分割提取
Fire1_Edge=uint8(Fire1_Edge);
Fire2_Edge=uint8(Fire2_Edge);
[m,n]=size(Fire1_Edge);
ROI_Buffer1=uint8(zeros(m,n,10));%四个模板缓存区域
C_Shape1=zeros(10,1);
S_Shape1=zeros(10,1);
H_Shape1=zeros(10,1);
Label_A=0;
ROI_Buffer2=uint8(zeros(m,n,10));%四个模板缓存区域
C_Shape2=zeros(10,1);
S_Shape2=zeros(10,1);
H_Shape2=zeros(10,1);
Label_B=0;
for Row2=1:m
    for Clo2=1:n
        if Fire1_Edge(Row2,Clo2)==1
            Label_A=Label_A+1;
            [ROI_Buffer1(:,:,Label_A),C_Shape1(Label_A,1),S_Shape1(Label_A,1),H_Shape1(Label_A,1)]=Pixel_Search(Fire1_Edge,Row2,Clo2,m,n);%把当前的数据赋给模板
            %figure,imshow(255*ROI_Buffer1(:,:,Label_A));%显示所得到的对应标号为Label的图像边界，这里需要注意的问题是：由图像的色彩等级不同，因此得到的图像可能全是黑色，需要乘以255（uint8）
            Fire1_Edge=Fire1_Edge-ROI_Buffer1(:,:,Label_A);%去除原图中已经提取完成的部分
        end
        if Fire2_Edge(Row2,Clo2)==1
            Label_B=Label_B+1;
            [ROI_Buffer2(:,:,Label_B),C_Shape2(Label_B,1),S_Shape2(Label_B,1),H_Shape2(Label_B,1)]=Pixel_Search(Fire2_Edge,Row2,Clo2,m,n);%把当前的数据赋给模板
            %figure,imshow(255*ROI_Buffer2(:,:,Label_B));%显示所得到的对应标号为Label的图像边界，这里需要注意的问题是：由图像的色彩等级不同，因此得到的图像可能全是黑色，需要乘以255（uint8）
            Fire2_Edge=Fire2_Edge-ROI_Buffer2(:,:,Label_B);%去除原图中已经提取完成的部分
        end        
    end
end

%相关帧检测算法
%最终的火焰模板ROI_Buffer1
Fire_Last=uint8(zeros(m,n));
for ROI_LabB=1:Label_B
    Flag_1=1;
    Flag_2=0;
    for ROI_LabA=1:Label_A
        if C_Shape2(ROI_LabB,1)<30 || abs(C_Shape2(ROI_LabB,1)-C_Shape1(ROI_LabA,1))<30%S_Shape2(ROI_LabB,1)<10 || abs(S_Shape2(ROI_LabB,1)-S_Shape1(ROI_LabA,1))<8%ROI_Buffer2(:,:,ROI_LabB)==ROI_Buffer1(:,:,ROI_LabA)%不一定要完全相等，可以限制面积大小来删除区域
            Flag_1=0;
        else
            Flag_2=1;
        end
    end
    if Flag_1==1 && Flag_2==1
        %disp(['ROI区域B中' num2str(ROI_LabB) '是火焰区域！'])
        Fire_Last=Fire_Last+ROI_Buffer2(:,:,ROI_LabB);%记得要乘以255
    else 
        %disp(['ROI区域B中' num2str(ROI_LabB) '不是火焰区域'])%disp(['a=' num2str(a) 'kg']),需要先将数值转换为字符串
    end
end
toc%T2=clock;%计时结束
%etime(T2,T1)%计算时间
frame=255*Fire_Last;
figure,imshow(frame);
K=bwmorph(Fire_Last,'dilate',1);%logical
K=imcomplement(K);
K=uint8(K(1:m1,1:n1));
FPS1(:,:,1)=FPS1(:,:,1).*K;
%FPS1(:,:,2)=FPS1(:,:,2).*K;
FPS1(:,:,3)=FPS1(:,:,3).*K;
figure,imshow(FPS1)
% p=imfill(frame,'holes');
% figure,imshow(p)
% p=imcomplement(p);
% figure,imshow(p)
% p=p(1:480,1:720)/255;
% % Model=zeros(size(FPS1));
% % Model(Fire_Last,1)=0;
% 
% %FPS1(:,:,1)=FPS1(:,:,1).*p;
% FPS1(:,:,2)=FPS1(:,:,2).*p;
% FPS1(:,:,3)=FPS1(:,:,3).*p;
% figure,imshow(FPS1)
% p=p.*FPS1;
% figure,imshow(p)
%[m,n]=find(Fire_Last==1);
% I=fill(m,n,'r');
% figure,imshow(I);
%局部阈值分割，这样能够避免出现过多的非连通区域
% FrameSubstract=uint8(Gray1-Gray2);
% FrameSubstractBw=im2bw(FrameSubstract,20/255);
% Win=10;
% thresh=0.1;
% FrameSubDens=LocalDensitySeg(FrameSubstractBw,Win,thresh);
% FrameSubstractBw=bwmorph(FrameSubDens,'dilate',2);
% figure, imshow(FrameSubstractBw);
% figure;imshow(FrameSubDens);