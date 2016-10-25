FPS1=imread('G:\Math Modeling\Matlab Development\FireDetect\TreeFire\FPSEx\TreeFire.mpg_000014.056.jpg');
Gray=rgb2gray(FPS1);
BW=Gray;
Th=max(max(Gray))%得到阈值大小
[m,n]=size(Gray);%size(FPS1)
Red=double(FPS1(:,:,1));%读取RGB图像的红色通道分量
Gre=double(FPS1(:,:,2));
Blu=double(FPS1(:,:,3));
%loop%
Lp1=0.22*Red+0.578*Gre+0.114*Blu;
Lp2=Red./(Red+Gre+Blu);
Th1=150;
Th2=0.35;
for Row=1:m
    for Clo=1:n
        if(Lp1(Row,Clo)>Th1 && Lp2(Row,Clo)>Th2)
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