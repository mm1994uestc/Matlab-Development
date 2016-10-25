%多项式拟合采用函数Function=polyfit(x,y,N):参数x和y为样本的输入值采用向量的输入方式，如x=[1 2 3 5 4 3];y=[10 34 53 69 18 11];N代表所要拟合的多项式函数的阶次%
%采用matlable拟合工具箱，采用在Command命令窗口输入cftool%
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