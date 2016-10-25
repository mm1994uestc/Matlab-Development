%Video Process
close all;
clear all;
clc
%%
WriterObj=VideoWriter('Fire.avi');
open(WriterObj);
temp1='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (';
temp2=').jpg';
m=484;%process for Pic not the truely size of pic，normally it's 4 larger than the size of pic 
n=724;
m1=480;%PIC_BUFFER1-->270*480
n1=720;%PIC_BUFFER1-->480*720
ROI_Buffer2=uint8(zeros(m,n,10));
C_Shape2=zeros(10,1);
S_Shape2=zeros(10,1);
H_Shape2=zeros(10,1);
ROI_Buffer1=uint8(zeros(m,n,10));
C_Shape1=zeros(10,1);
S_Shape1=zeros(10,1);
H_Shape1=zeros(10,1);
%%
for F=1:300
    tic
Path1=strcat(temp1,num2str(F),temp2);
Path2=strcat(temp1,num2str(F+1),temp2);
FPS1=imread(Path1);
FPS2=imread(Path2);
[Fire1,Fire1_Iave]=FZoneExFun(FPS1);
[Fire2,Fire2_Iave]=FZoneExFun(FPS2);
Fire1_Edge=uint8(bwperim(Fire1,8));
Fire2_Edge=uint8(bwperim(Fire2,8));
%[m,n]=size(Fire1_Edge)

Label_A=0;
Label_B=0;
for Row2=1:m
    for Clo2=1:n
        if Fire1_Edge(Row2,Clo2)==1
            Label_A=Label_A+1;
            [ROI_Buffer1(:,:,Label_A),C_Shape1(Label_A,1),S_Shape1(Label_A,1),H_Shape1(Label_A,1)]=Pixel_Search(Fire1_Edge,Row2,Clo2,m,n);
            Fire1_Edge=Fire1_Edge-ROI_Buffer1(:,:,Label_A);
        end
        if Fire2_Edge(Row2,Clo2)==1
            Label_B=Label_B+1;
            [ROI_Buffer2(:,:,Label_B),C_Shape2(Label_B,1),S_Shape2(Label_B,1),H_Shape2(Label_B,1)]=Pixel_Search(Fire2_Edge,Row2,Clo2,m,n);
            Fire2_Edge=Fire2_Edge-ROI_Buffer2(:,:,Label_B);
        end        
    end
end
Fire_Last=uint8(zeros(m,n));
for ROI_LabB=1:Label_B
    Flag_1=1;
    Flag_2=0;
    for ROI_LabA=1:Label_A
        if C_Shape2(ROI_LabB,1)<30 || abs(C_Shape2(ROI_LabB,1)-C_Shape1(ROI_LabA,1))<100
            Flag_1=0;
        else
            Flag_2=1;
        end
    end
    if Flag_1==1 && Flag_2==1
        Fire_Last=Fire_Last+ROI_Buffer2(:,:,ROI_LabB);%记得要乘以255
    end
end
frame=255*Fire_Last;
%P=imfill(frame,'holes');
K=bwmorph(Fire_Last,'dilate',1);%logical
K=imcomplement(K);%if the Iave is lower,we should delete this loop,on the
%contray ,we need the loop when Iave is high
K=uint8(K(1:m1,1:n1));
FPS1(:,:,1)=FPS1(:,:,1).*K;
%FPS1(:,:,2)=FPS1(:,:,2).*K;
FPS1(:,:,3)=FPS1(:,:,3).*K;
writeVideo(WriterObj,FPS1);
    toc
end
%%
close(WriterObj);