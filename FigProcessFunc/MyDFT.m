function [signal_Fre]=MyDFT( signal_Tim )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%���������FFT�����㷨Ч��Ҫ��ߣ�һ��ʹ��2���ݴη�����ɢ�ź�����ֵ����8��16��32��64�Ȳ������������һ�����FFT�㷨ʱ��Ҫ�ǵý����ݲ��㵽2���ݴη�
 N=length(signal_Tim);
 for k=1:N%������źų���-1��x�η���������ʵ����FFTShift�Ĺ��ܣ�������������Ƶ���ƽ�Ʊ任�൱����ʱ��ĵ��Ʊ仯����FFTShiftƽ�Ƶķ�������ƽ��Ƶ�ʵ�һ�룬���Եõ��Ľ�����ǳ���-1��x�η�
     signal_Tim(k)=signal_Tim(k)*((-1)^(k-1));
 end
 signal_Fre=0;
 for u=1:N
     signal_Fre(u)=0;
     for n=1:N
         signal_Fre(u)=signal_Fre(u)+signal_Tim(n)*exp((-1i)*2*pi*(n-1)*(u-1)/N);
     end
 end
 signal_Fre=abs(signal_Fre);
end