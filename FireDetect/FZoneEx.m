% FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000011.371.jpg');
% FPS2=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000011.421.jpg');
% FPS3=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000011.457.jpg');
% FPS4=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000011.554.jpg');
%这里需要读取多张图片，下面的处理都一样%
FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000011.371.jpg');
%FPS1=im2double(Pic);
%[FPS1_X,map]=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg');%FPS_X用于存储引索图像数据，即相关颜色映射表的序号值，map用于存储与该引索色图像相关的颜色映射表
%info=imfinfo('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg')%读取图片信息
Gray=rgb2gray(FPS1);
Red=double(FPS1(:,:,1));%读取RGB图像的红色通道分量,并转化为double型
Gre=double(FPS1(:,:,2));
Blu=double(FPS1(:,:,3));
BW=Gray;
Th=max(max(Gray));%得到阈值大小
[m,n]=size(Gray);%size(FPS1)
RGB_Max=max(max(Red,Gre),Blu);
RGB_Min=min(min(Red,Gre),Blu);

%HSI分量%
I=(Red+Gre+Blu)/3;%HSI的I分量
S=1-RGB_Min./I;

%阈值参数定义%
St=45;
Rt=130;
Rth=230;
Gth=230;%230
Th3=4;
Th_I=127;

T1=abs(Red-Gre);
T2=abs(Gre-Blu);
T3=abs(Red-Blu);
RGB_Ave=(RGB_Max+RGB_Min)/2;
Sth=(255-Red)*St/Rt;
T=T2+T3;
%通过亮度分量基本得出疑似火焰的区域%&& T(Row,Clo)>Th3
for Row=1:m
    for Clo=1:n
        if(Red(Row,Clo)>Blu(Row,Clo) && Red(Row,Clo)>Rth  && Gre(Row,Clo)>Gth)%&& T(Row,Clo)>Th3)%&& RGB_Ave(Row,Clo)>Th_I) 
            BW(Row,Clo)=Th;
        else
            BW(Row,Clo)=0;
        end
    end
end
subplot(3,4,1);
imshow(FPS1)
subplot(3,4,2);
imshow(Gray)
subplot(3,4,3);
imshow(BW)