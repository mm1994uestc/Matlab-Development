%��ȡͼ�� %
clear all;
close all;
clc;
m1=270;%ͼ��Ĵ�С big 480*720(PIC_BUFFER2)  small 270*480(PIC_BUFFER1)
n1=480;
tic%T1=clock;%��ʱ��ʼ
FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER1\Fire (1).jpg');
FPS2=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER1\Fire (2).jpg');
% FPS3=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (3).jpg');
% FPS4=imread('G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (4).jpg');
%��ֵͼ��%
%imwrite(I,'image.jpg');%��MATLABת��ͼƬ�ĸ�ʽ��������׺����ͬ�������ʽ��ͬ
[Fire1,Fire1_Iave]=FZoneExFun(FPS1);
[Fire2,Fire2_Iave]=FZoneExFun(FPS2);
% [Fire3,Fire3_Iave]=FZoneExFun(FPS3);
% [Fire4,Fire4_Iave]=FZoneExFun(FPS4);
%[S,Boundary,Num]=ShapeClassification(Fire1);


%�Ҷ�ͼ��%
Gray1=rgb2gray(FPS1);
Gray2=rgb2gray(FPS2);
% Gray3=rgb2gray(FPS3);
% Gray4=rgb2gray(FPS4);

%��ʾͼ���Ե
% Fire1_Edge=edge(Fire1);%����ֶϵ㣬�߽�ͼ�β����
% Fire2_Edge=edge(Fire2);
% Fire3_Edge=edge(Fire3);
% Fire4_Edge=edge(Fire4);
Fire1_Edge=bwperim(Fire1,8);%��ά��ֵͼ��ı߽���ȡ����bwperim(BW,N),NΪ�߽�ʹ�õ�����ȡ2Ϊ2ά4����  8Ϊ2ά8����6Ϊ3ά6����18Ϊ3ά18����
Fire2_Edge=bwperim(Fire2,8);
% Fire3_Edge=bwperim(Fire3,8);
% Fire4_Edge=bwperim(Fire4,8);
%��ʾͼ��%
% figure,
% Display(FPS1,Gray1,Fire1,Fire1_Edge,1)%ԭͼ�� �Ҷ�ͼ�� ��ֵͼ�� ��ֵ��Ե��ȡ ����λ��
% Fire1_Iave;%����Ҫ��������Gth������������ߣ����Ⱥ�Gth��ؽ����Ҫ���������
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
% Frame_Sub=Fire2_Edge-Fire1_Edge;%֡�
% figure,imshow(Frame_Sub)
figure, imshow(Fire1_Edge)
figure, imshow(Fire2_Edge)

%ROI�����Զ��ָ���ȡ
Fire1_Edge=uint8(Fire1_Edge);
Fire2_Edge=uint8(Fire2_Edge);
[m,n]=size(Fire1_Edge);
ROI_Buffer1=uint8(zeros(m,n,10));%�ĸ�ģ�建������
C_Shape1=zeros(10,1);
S_Shape1=zeros(10,1);
H_Shape1=zeros(10,1);
Label_A=0;
ROI_Buffer2=uint8(zeros(m,n,10));%�ĸ�ģ�建������
C_Shape2=zeros(10,1);
S_Shape2=zeros(10,1);
H_Shape2=zeros(10,1);
Label_B=0;
for Row2=1:m
    for Clo2=1:n
        if Fire1_Edge(Row2,Clo2)==1
            Label_A=Label_A+1;
            [ROI_Buffer1(:,:,Label_A),C_Shape1(Label_A,1),S_Shape1(Label_A,1),H_Shape1(Label_A,1)]=Pixel_Search(Fire1_Edge,Row2,Clo2,m,n);%�ѵ�ǰ�����ݸ���ģ��
            %figure,imshow(255*ROI_Buffer1(:,:,Label_A));%��ʾ���õ��Ķ�Ӧ���ΪLabel��ͼ��߽磬������Ҫע��������ǣ���ͼ���ɫ�ʵȼ���ͬ����˵õ���ͼ�����ȫ�Ǻ�ɫ����Ҫ����255��uint8��
            Fire1_Edge=Fire1_Edge-ROI_Buffer1(:,:,Label_A);%ȥ��ԭͼ���Ѿ���ȡ��ɵĲ���
        end
        if Fire2_Edge(Row2,Clo2)==1
            Label_B=Label_B+1;
            [ROI_Buffer2(:,:,Label_B),C_Shape2(Label_B,1),S_Shape2(Label_B,1),H_Shape2(Label_B,1)]=Pixel_Search(Fire2_Edge,Row2,Clo2,m,n);%�ѵ�ǰ�����ݸ���ģ��
            %figure,imshow(255*ROI_Buffer2(:,:,Label_B));%��ʾ���õ��Ķ�Ӧ���ΪLabel��ͼ��߽磬������Ҫע��������ǣ���ͼ���ɫ�ʵȼ���ͬ����˵õ���ͼ�����ȫ�Ǻ�ɫ����Ҫ����255��uint8��
            Fire2_Edge=Fire2_Edge-ROI_Buffer2(:,:,Label_B);%ȥ��ԭͼ���Ѿ���ȡ��ɵĲ���
        end        
    end
end

%���֡����㷨
%���յĻ���ģ��ROI_Buffer1
Fire_Last=uint8(zeros(m,n));
for ROI_LabB=1:Label_B
    Flag_1=1;
    Flag_2=0;
    for ROI_LabA=1:Label_A
        if C_Shape2(ROI_LabB,1)<30 || abs(C_Shape2(ROI_LabB,1)-C_Shape1(ROI_LabA,1))<30%S_Shape2(ROI_LabB,1)<10 || abs(S_Shape2(ROI_LabB,1)-S_Shape1(ROI_LabA,1))<8%ROI_Buffer2(:,:,ROI_LabB)==ROI_Buffer1(:,:,ROI_LabA)%��һ��Ҫ��ȫ��ȣ��������������С��ɾ������
            Flag_1=0;
        else
            Flag_2=1;
        end
    end
    if Flag_1==1 && Flag_2==1
        %disp(['ROI����B��' num2str(ROI_LabB) '�ǻ�������'])
        Fire_Last=Fire_Last+ROI_Buffer2(:,:,ROI_LabB);%�ǵ�Ҫ����255
    else 
        %disp(['ROI����B��' num2str(ROI_LabB) '���ǻ�������'])%disp(['a=' num2str(a) 'kg']),��Ҫ�Ƚ���ֵת��Ϊ�ַ���
    end
end
toc%T2=clock;%��ʱ����
%etime(T2,T1)%����ʱ��
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
%�ֲ���ֵ�ָ�����ܹ�������ֹ���ķ���ͨ����
% FrameSubstract=uint8(Gray1-Gray2);
% FrameSubstractBw=im2bw(FrameSubstract,20/255);
% Win=10;
% thresh=0.1;
% FrameSubDens=LocalDensitySeg(FrameSubstractBw,Win,thresh);
% FrameSubstractBw=bwmorph(FrameSubDens,'dilate',2);
% figure, imshow(FrameSubstractBw);
% figure;imshow(FrameSubDens);