%%直方图均匀化MATLAB程序设计
clear;clf;
close all;
clc;
I=imread('rice.png');
[m,n]=size(I);
Fre=zeros(1,256);
grade=0:255;
for Grade=0:255%计算出所有的亮度的直方图数据
    for row=1:m
        for clo=1:n
            if I(row,clo)==Grade
                Fre(Grade+1)=Fre(Grade+1)+1;%统计Crade灰度级出现的次数，出现一次+1
            end
        end
    end
end
subplot(2,2,1)
stem(grade,Fre)%绘制第一类直方图
xlabel('r域灰度级')
ylabel('出现频率')
P=Fre/(m*n*1.0);%出现频率计算
% subplot(2,2,1)
% stem(grade,P)%绘制第二类直方图
% xlabel('灰度级')
% ylabel('出现概率')
%离散函数变换方法：
S1=zeros(1,256);%Sk的double型数据计算，连续的积分等于离散的求和
Gre_Num=zeros(1,256);%创建灰度级像素点总数统计矩阵
J=I;%处理后的图像原型
for k=1:256 %循环求得所有的Sk量（从1到255）
    for i=1:k %循环起始值是1，终止值是求和函数的上变量k
        S1(k)=S1(k)+P(i);%对所有Sk进行计算
    end
    F=round(S1(k)*255)+1;%Sk的舍入过程，将灰度数据压缩到S的灰度级中，round函数进行四舍五入,round函数的返回值是整形的，故可用于数组的下标
    Gre_Num(F)=Gre_Num(F)+Fre(k);%累加灰度级为F的像素点总数
    for row=1:m %均值化之后的图像
        for clo=1:n
            if I(row,clo)==(k-1)%测试灰度及是否满足当前进行转换的k级灰度
                J(row,clo)=F-1;%得到处理后的图像
            end
        end
    end
end
subplot(2,2,3)%处理前
imshow(I)
subplot(2,2,4)%处理后
imshow(J)
subplot(2,2,2)%直方图均匀化
stem(grade,Gre_Num)
xlabel('s域灰度级')
ylabel('出现频率')