%����ʽ��ϲ��ú���Function=polyfit(x,y,N):����x��yΪ����������ֵ�������������뷽ʽ����x=[1 2 3 5 4 3];y=[10 34 53 69 18 11];N������Ҫ��ϵĶ���ʽ�����Ľ״�%
%����matlable��Ϲ����䣬������Command���������cftool%
BasicData_X=[0 0.3 0.6 0.9 1.2 1.5 1.8 2.1 2.4 2.7 3.0];
BasicData_Y=[2.0 2.378 3.944 7.346 13.232 22.25 35.048 52.274 74.576 102.7602 137.0];
Function=polyfit(BasicData_X,BasicData_Y,3)
syms x F(x)
f(x)=poly2sym(Function,x)
plot(Function)
% p1 =  -1.396e-07;
% p2 =   5.203e-05;
% p3 =   -0.006762;
% p4 =      0.3353;
% p5 =      -2.849;
% p6 =       86.09;
% x=[0:0.1:150];
% y=p1*x.^5 + p2*x.^4 + p3*x.^3 + p4*x.^2 + p5*x + p6;
% plot(x,y);
% xlabel('Iave')
% ylabel('Gth')