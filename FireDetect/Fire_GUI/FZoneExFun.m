function [s,Iaverage] = FZoneExFun(FPS)
%[FPS_X,map]=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg');%FPS_X���ڴ洢����ͼ�����ݣ��������ɫӳ�������ֵ��map���ڴ洢�������ɫͼ����ص���ɫӳ���
%info=imfinfo('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg')%��ȡͼƬ��Ϣ
Gray=rgb2gray(FPS);
Red=double(FPS(:,:,1));%��ȡRGBͼ��ĺ�ɫͨ������,��ת��Ϊdouble��
Gre=double(FPS(:,:,2));
Blu=double(FPS(:,:,3));

BW=Gray;
Th=max(max(Gray));%�õ���ֵ��С
[m,n]=size(Gray);%size(FPS)
% RGB_Max=max(max(Red,Gre),Blu);
% RGB_Min=min(min(Red,Gre),Blu);

%�õ���ֵͼ��֮�����ƽ�����������ͨ�����
 msk=[0 0 0 0 0;0 1 1 1 0;0 1 1 1 0;0 1 1 1 0;0 0 0 0 0;];

%HSI����%
I=(Red+Gre+Blu)/3;%HSI��I����
Iave=0;
for Row=1:m
    for Clo=1:n
        Iave=Iave+I(Row,Clo);
    end
end
Iaverage=Iave/(m*n);
%S=1-RGB_Min./I;
%Gth������ϵķ���ֱ����MATLAB��cftool���߰�������excel���%
Gth=-1.396e-07*Iaverage^5 + 5.203e-05*Iaverage^4 - 0.006762*Iaverage^3 + 0.3353*Iaverage^2 - 2.849*Iaverage + 86.09;
%��ֵ��������%
% St=45;
% Rt=135;
Rth=200;%200

% Th1=20;
% Th2=20;
Th3=4;
%Th_I=190;

%������������%
%T1=abs(Red-Gre);
T2=abs(Gre-Blu);
T3=abs(Red-Blu);
%RGB_Ave=(RGB_Max+RGB_Min)/2;
%Sth=(255-Red)*St/Rt;
T=T2+T3;
%ͨ�����ȷ��������ó����ƻ��������%&& T(Row,Clo)>Th3
for Row=1:m% &&   RGB_Ave(Row,Clo)>Th_I   Gre(Row,Clo)>Gth && Red(Row,Clo)>Rth  T(Row,Clo)>=Th3 && S(Row,Clo)>=Sth(Row,Clo) && T(Row,Clo)>=Th3
    for Clo=1:n%  R>B  G>B  R>Rth  G>Gth(Y)  T2+T3>Th3  S>Sth  RGB_Ave>Th_I 
        if(Red(Row,Clo)>=Blu(Row,Clo) && Gre(Row,Clo)>=Blu(Row,Clo) && Red(Row,Clo)>=Rth && Gre(Row,Clo)>=Gth && T(Row,Clo)>=Th3)
            BW(Row,Clo)=Th;
        else
            BW(Row,Clo)=0;
        end
    end
end
%��ͼ�������ʹ���bwmorph(BW,'fun',n)������BWΪ��ֵͼ��
%'fun'����ȡ'erode':��ʴ��ʹ�ýṹԪ�ؾ���ones(3)���и�ʴ��
%'fun'����ȡ'dilate':���ͣ�ʹ�ýṹԪ�ؾ���ones(3)���и�ʴ��
%'fun'����ȡ'open':���ж�ֵ�����㣨�ȸ�ʴ�����ͣ���
%'fun'����ȡ'close':���ж�ֵ�����㣨�����ͺ�ʴ����
%'fun'����ȡ'clean':�����ȥ���������ص㡣
BW_Erode=bwmorph(BW,'dilate',1);
s=conv2(double(BW_Erode),double(msk));%�Եõ��Ķ�ֵͼ�����ƽ�������Ա������ͨ��ĸ���
end