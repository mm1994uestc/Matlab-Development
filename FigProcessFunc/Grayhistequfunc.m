%%ֱ��ͼ���Ȼ�MATLAB�������
clear;clf;
close all;
clc;
I=imread('rice.png');
[m,n]=size(I);
Fre=zeros(1,256);
grade=0:255;
for Grade=0:255%��������е����ȵ�ֱ��ͼ����
    for row=1:m
        for clo=1:n
            if I(row,clo)==Grade
                Fre(Grade+1)=Fre(Grade+1)+1;%ͳ��Crade�Ҷȼ����ֵĴ���������һ��+1
            end
        end
    end
end
subplot(2,2,1)
stem(grade,Fre)%���Ƶ�һ��ֱ��ͼ
xlabel('r��Ҷȼ�')
ylabel('����Ƶ��')
P=Fre/(m*n*1.0);%����Ƶ�ʼ���
% subplot(2,2,1)
% stem(grade,P)%���Ƶڶ���ֱ��ͼ
% xlabel('�Ҷȼ�')
% ylabel('���ָ���')
%��ɢ�����任������
S1=zeros(1,256);%Sk��double�����ݼ��㣬�����Ļ��ֵ�����ɢ�����
Gre_Num=zeros(1,256);%�����Ҷȼ����ص�����ͳ�ƾ���
J=I;%������ͼ��ԭ��
for k=1:256 %ѭ��������е�Sk������1��255��
    for i=1:k %ѭ����ʼֵ��1����ֵֹ����ͺ������ϱ���k
        S1(k)=S1(k)+P(i);%������Sk���м���
    end
    F=round(S1(k)*255)+1;%Sk��������̣����Ҷ�����ѹ����S�ĻҶȼ��У�round����������������,round�����ķ���ֵ�����εģ��ʿ�����������±�
    Gre_Num(F)=Gre_Num(F)+Fre(k);%�ۼӻҶȼ�ΪF�����ص�����
    for row=1:m %��ֵ��֮���ͼ��
        for clo=1:n
            if I(row,clo)==(k-1)%���ԻҶȼ��Ƿ����㵱ǰ����ת����k���Ҷ�
                J(row,clo)=F-1;%�õ�������ͼ��
            end
        end
    end
end
subplot(2,2,3)%����ǰ
imshow(I)
subplot(2,2,4)%�����
imshow(J)
subplot(2,2,2)%ֱ��ͼ���Ȼ�
stem(grade,Gre_Num)
xlabel('s��Ҷȼ�')
ylabel('����Ƶ��')