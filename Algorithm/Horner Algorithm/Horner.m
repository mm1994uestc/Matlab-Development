%Horner Algorithm
%A calculate mothed for polynomial(����ʽ) Algorithm
clear;clear all;
close all;
clc
coeff=[1,2,3,4];%Polynomial coefficients����ʽϵ��
n=length(coeff);%The length of the coeff list!
L=1;%The length/2 for plot and calculate!
X=input('Please enter a number for calculate:');%The middle dot for calculate!

Sum=zeros(n,1)';%��ʼ��Sum
Sum(n)=coeff(n);
x=X-L:0.1:X+L;
K=length(x);
y=zeros(1,K);
F=1;
for x=X-L:0.1:X+L
    for i=n:-1:2
        Sum(i-1)=Sum(i)*x+coeff(i-1);%�Һ���ǰ�ļ���취�����ڲ����ⲿ�˵ļ��㷽����
    end
    y(F)=Sum(1);
    F=F+1;
end
Sum=y(F/2)%calculate the middle value and show out!
x=X-L:0.1:X+L;
plot(x,y,'*')
title('Horner Algorithm');
xlabel('X-axis');%when you are using the function of label,you must clear the workspace,otherwise there will be a wrong erro happend for that the matrix is exceed the dimension of matrix
ylabel('Y-axis');