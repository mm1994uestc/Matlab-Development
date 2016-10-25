%Histogram Matching
%% ֱ��ͼ���Ƶķ���
clear all
close all
clc
x=0:0.01:1;
y=abs(-2*x+1);
plot(x,y)
title('Ŀ������ܶȷֲ�����')
xlabel('Gray Grade S')
ylabel('Prob Of S')
Im=imread('rice.png');
figure,imhist(Im)
title('The histgram maked by MATLAB Func!')
[m,n]=size(Im);
Fre=zeros(1,256);
grade=0:255;
for Grade=0:255%��������е����ȵ�ֱ��ͼ����
    for row=1:m
        for clo=1:n
            if Im(row,clo)==Grade
                Fre(Grade+1)=Fre(Grade+1)+1;%ͳ��Crade�Ҷȼ����ֵĴ���������һ��+1
            end
        end
    end
end
subplot(2,2,1)
stem(grade,Fre)%���Ƶ�һ��ֱ��ͼ
xlabel('r��Ҷȼ�')
ylabel('����Ƶ��')
%% ֱ��ͼ���Ȼ�����
P=Fre/(m*n*1.0);%����Ƶ�ʼ���
S1=zeros(1,256);%Sk��double�����ݼ��㣬�����Ļ��ֵ�����ɢ�����
Gre_Num=zeros(1,256);%�����Ҷȼ����ص�����ͳ�ƾ���
J=Im;%������ͼ��ԭ��
for k=1:256 %ѭ��������е�Sk������1��255��
    for i=1:k %ѭ����ʼֵ��1����ֵֹ����ͺ������ϱ���k
        S1(k)=S1(k)+P(i);%������Sk���м���
    end
    F=round(S1(k)*255)+1;%Sk��������̣����Ҷ�����ѹ����S�ĻҶȼ��У�round����������������,round�����ķ���ֵ�����εģ��ʿ�����������±�
    Gre_Num(F)=Gre_Num(F)+Fre(k);%�ۼӻҶȼ�ΪF�����ص�����
    for row=1:m %��ֵ��֮���ͼ��
        for clo=1:n
            if Im(row,clo)==(k-1)%���ԻҶȼ��Ƿ����㵱ǰ����ת����k���Ҷ�
                J(row,clo)=F-1;%�õ�������ͼ��
            end
        end
    end
end
subplot(2,2,3)%����ǰ
imshow(Im)
subplot(2,2,4)%�����
imshow(J)
subplot(2,2,2)%ֱ��ͼ���Ȼ�
stem(grade,Gre_Num)
xlabel('s��Ҷȼ�')
ylabel('����Ƶ��')
%% ���Ҷȱ任ʹ��ͼ���ֱ��ͼ�ֲ�������Ӧ�ı仯��ȥ�Ҷȱ任�Ĺ�ʽΪ���Էֶκ���
Im=double(Im);%ͼ������������֮ǰ���ת����double������
I_GrayTrans=Im;
A=[110,35];%A(1)��A(2)����С�ڵ���128
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
%% �������ֱ��ͼƥ��ķ������ֱ��ͼ�ı任
L=8;%�Ҷȼ������λ��
A=(2^L-1)/2;%�Ҷȼ�������
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
%% ��������ӽ��н���ֱ��ͼ���Ȼ����Ѿ��õ��˾��⻯֮���ͼ��J��
A=128;
Grade_S=zeros(1,256);
for i=1:256
    %Grade_S(i)=A*()
end