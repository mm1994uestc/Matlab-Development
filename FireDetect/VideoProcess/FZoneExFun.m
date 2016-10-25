function [s,Iaverage] = FZoneExFun(FPS)
%[FPS_X,map]=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg');%FPS_X用于存储引索图像数据，即相关颜色映射表的序号值，map用于存储与该引索色图像相关的颜色映射表
%info=imfinfo('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg')%读取图片信息
Gray=rgb2gray(FPS);
Red=double(FPS(:,:,1));%读取RGB图像的红色通道分量,并转化为double型
Gre=double(FPS(:,:,2));
Blu=double(FPS(:,:,3));

BW=Gray;
%Th=max(max(Gray));%得到阈值大小
%[m,n]=size(Gray);%size(FPS)
% RGB_Max=max(max(Red,Gre),Blu);
% RGB_Min=min(min(Red,Gre),Blu);
%图像的大小我们去480*720 m*n

%得到二值图像之后进行平滑处理减少连通体个数
 msk=[0 0 0 0 0;0 1 1 1 0;0 1 1 1 0;0 1 1 1 0;0 0 0 0 0;];

%HSI分量%
I=(Red+Gre+Blu)/3;%HSI的I分量
Iave=0;
for Row=1:480%m
    for Clo=1:720%n
        Iave=Iave+I(Row,Clo);
    end
end
Iaverage=Iave/345600;%Iave/(m*n);
%S=1-RGB_Min./I;
%Gth函数拟合的方法直接用MATLAB的cftool工具包，不用excel拟合%
Gth=-1.396e-07*Iaverage^5 + 5.203e-05*Iaverage^4 - 0.006762*Iaverage^3 + 0.3353*Iaverage^2 - 2.849*Iaverage + 100.09;
%Gth=230;%very nice
%阈值参数定义%
% St=45;
% Rt=135;
Rth=200;%200

% Th1=20;
% Th2=20;
Th3=4;
%Th_I=190;

%条件参数计算%
%T1=abs(Red-Gre);
T2=abs(Gre-Blu);
T3=abs(Red-Blu);
%RGB_Ave=(RGB_Max+RGB_Min)/2;
%Sth=(255-Red)*St/Rt;
T=T2+T3;
%通过亮度分量基本得出疑似火焰的区域%&& T(Row,Clo)>Th3
for Row=1:480%m% &&   RGB_Ave(Row,Clo)>Th_I   Gre(Row,Clo)>Gth && Red(Row,Clo)>Rth  T(Row,Clo)>=Th3 && S(Row,Clo)>=Sth(Row,Clo) && T(Row,Clo)>=Th3
    for Clo=1:720%n%  R>B  G>B  R>Rth  G>Gth(Y)  T2+T3>Th3  S>Sth  RGB_Ave>Th_I 
        BW(Row,Clo)=uint8((Red(Row,Clo)>=Blu(Row,Clo) && Gre(Row,Clo)>=Blu(Row,Clo) && Red(Row,Clo)>=Rth && Gre(Row,Clo)>=Gth && T(Row,Clo)>=Th3));
    end
end
%对图像做膨胀处理，bwmorph(BW,'fun',n)函数的BW为二值图像
%'fun'可以取'erode':腐蚀，使用结构元素矩阵ones(3)进行腐蚀。
%'fun'可以取'dilate':膨胀，使用结构元素矩阵ones(3)进行腐蚀。
%'fun'可以取'open':进行二值开运算（先腐蚀后膨胀）。
%'fun'可以取'close':进行二值闭运算（先膨胀后腐蚀）。
%'fun'可以取'clean':清除，去除孤立像素点。
%figure,imshow(BW)
BW_Erode=bwmorph(BW,'dilate',1);
%figure,imshow(BW_Erode)
s=conv2(double(BW_Erode),double(msk));%对得到的二值图像进行平滑处理以便减少连通体的个数
s=bwfill(s,'holes');
end