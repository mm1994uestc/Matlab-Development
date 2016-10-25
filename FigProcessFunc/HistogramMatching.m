%Histogram Matching
%% 直方图绘制的方法
clear all
close all
clc
x=0:0.01:1;
y=abs(-2*x+1);
plot(x,y)
title('目标概率密度分布函数')
xlabel('Gray Grade S')
ylabel('Prob Of S')
Im=imread('rice.png');
figure,imhist(Im)
title('The histgram maked by MATLAB Func!')
[m,n]=size(Im);
Fre=zeros(1,256);
grade=0:255;
for Grade=0:255%计算出所有的亮度的直方图数据
    for row=1:m
        for clo=1:n
            if Im(row,clo)==Grade
                Fre(Grade+1)=Fre(Grade+1)+1;%统计Crade灰度级出现的次数，出现一次+1
            end
        end
    end
end
subplot(2,2,1)
stem(grade,Fre)%绘制第一类直方图
xlabel('r域灰度级')
ylabel('出现频率')
%% 直方图均匀化方法
P=Fre/(m*n*1.0);%出现频率计算
S1=zeros(1,256);%Sk的double型数据计算，连续的积分等于离散的求和
Gre_Num=zeros(1,256);%创建灰度级像素点总数统计矩阵
J=Im;%处理后的图像原型
for k=1:256 %循环求得所有的Sk量（从1到255）
    for i=1:k %循环起始值是1，终止值是求和函数的上变量k
        S1(k)=S1(k)+P(i);%对所有Sk进行计算
    end
    F=round(S1(k)*255)+1;%Sk的舍入过程，将灰度数据压缩到S的灰度级中，round函数进行四舍五入,round函数的返回值是整形的，故可用于数组的下标
    Gre_Num(F)=Gre_Num(F)+Fre(k);%累加灰度级为F的像素点总数
    for row=1:m %均值化之后的图像
        for clo=1:n
            if Im(row,clo)==(k-1)%测试灰度及是否满足当前进行转换的k级灰度
                J(row,clo)=F-1;%得到处理后的图像
            end
        end
    end
end
subplot(2,2,3)%处理前
imshow(Im)
subplot(2,2,4)%处理后
imshow(J)
subplot(2,2,2)%直方图均匀化
stem(grade,Gre_Num)
xlabel('s域灰度级')
ylabel('出现频率')
%% 做灰度变换使得图像的直方图分布发生相应的变化，去灰度变换的公式为线性分段函数
Im=double(Im);%图像数据做运算之前务必转换成double型数据
I_GrayTrans=Im;
A=[110,35];%A(1)和A(2)必须小于等于128
B=[0,0];
B(1)=255-A(1);
B(2)=255-A(2);
for row=1:m
    for clo=1:n
        if Im(row,clo)>=0 && Im(row,clo)<A(1)
            I_GrayTrans(row,clo)=Im(row,clo)*A(2)/A(1);
        end
        if Im(row,clo)>=A(1) && Im(row,clo)<B(1)
            I_GrayTrans(row,clo)=Im(row,clo)*(B(2)-A(2))/(B(1)-A(1))+128*(B(1)-A(1)-B(2)+A(2))/(B(1)-A(1));
        end
        if Im(row,clo)>=B(1) && Im(row,clo)<256
            I_GrayTrans(row,clo)=Im(row,clo)*(256-B(2))/(256-B(1))+256*(B(2)-B(1))/(256-B(1));
        end
    end
end
figure,subplot(2,1,1)
Im=uint8(Im);
imshow(Im)
subplot(2,1,2)
I_GrayTrans=uint8(I_GrayTrans);
imshow(I_GrayTrans)
figure,imhist(I_GrayTrans)
%% 下面采用直方图匹配的方法完成直方图的变换
L=8;%灰度级别的总位数
A=(2^L-1)/2;%灰度级别总数
Pr=Fre/(m*n);
GS=zeros(1,256);
GS_Fre=zeros(1,256);
sum=0;
for G_S=1:127
    for i=1:G_S
        sum=sum+Pr(i);
    end
    GS(G_S)=round(A*(1-sqrt(1-2*sum)));
%     if GS(G_S)>255
%         GS(G_S)=0;
%     end 
    sum=0;
end
sum=0;
for G_S=128:256
    for i=1:G_S
        sum=sum+Pr(i);
    end
    GS(G_S)=round(A*(1+sqrt(1+2*sum)));
%     if GS(G_S)>255
%         GS(G_S)=0;
%     end
    sum=0;
end
Pic_Match=Im;
for Row=1:m
     for Clo=1:n
         Pic_Match(Row,Clo)=GS(Im(Row,Clo)+1);
     end
end
figure,imshow(Pic_Match)
figure,imhist(Pic_Match)
%% 方法二间接进行进行直方图均匀化（已经得到了均衡化之后的图像J）
A=128;
Grade_S=zeros(1,256);
for i=1:256
    %Grade_S(i)=A*()
end