FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000002.315.jpg');

%������Ҫ��ȡ����ͼƬ������Ĵ���һ��%


%FPS1=im2double(Pic);
%[FPS1_X,map]=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg');%FPS_X���ڴ洢����ͼ�����ݣ��������ɫӳ�������ֵ��map���ڴ洢�������ɫͼ����ص���ɫӳ���
%info=imfinfo('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg')%��ȡͼƬ��Ϣ
Gray=rgb2gray(FPS1);
Red=double(FPS1(:,:,1));%��ȡRGBͼ��ĺ�ɫͨ������,��ת��Ϊdouble��
Gre=double(FPS1(:,:,2));
Blu=double(FPS1(:,:,3));
BW=Gray;
Th=max(max(Gray))%�õ���ֵ��С
[m,n]=size(Gray);%size(FPS1)

T1=abs(Red-Gre);
T2=abs(Gre-Blu);
T3=abs(Red-Blu);
RGB_Max=max(max(Red,Gre),Blu);
RGB_Min=min(min(Red,Gre),Blu);
RGB_Ave=(RGB_Max+RGB_Min)/2;
Sth=(255-Red)*St/Rt;
T=T2+T3;

%HSI����%
I=(Red+Gre+Blu)/3;%HSI��I����
S=1-RGB_Min./I;

%��ֵ��������%
St=45;
Rt=130;
Rth=230;
Gth=230;%230
Th3=4;
Th_I=127;
%ͨ�����ȷ��������ó����ƻ��������%&& T(Row,Clo)>Th3
for Row=1:m
    for Clo=1:n
        if(Red(Row,Clo)>Blu(Row,Clo) && Red(Row,Clo)>Rth  && Gre(Row,Clo)>Gth)%&& T(Row,Clo)>Th3)%&& RGB_Ave(Row,Clo)>Th_I) 
            BW(Row,Clo)=Th;
        else
            BW(Row,Clo)=0;
        end
    end
end
subplot(2,2,1);
imshow(FPS1)
subplot(2,2,2);
imshow(Gray)
subplot(2,2,3);
imshow(BW)