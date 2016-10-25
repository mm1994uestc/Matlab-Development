function [signal_Fre]=MyDFT( signal_Tim )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%蝶形运算的FFT运算算法效率要提高，一般使用2的幂次方的离散信号输入值，如8、16、32、64等采样点数，因此一般采用FFT算法时，要记得将数据补零到2的幂次方
 N=length(signal_Tim);
 for k=1:N%这里对信号乘以-1的x次方，这样就实现了FFTShift的功能，分析方法采用频域的平移变换相当于在时域的调制变化，而FFTShift平移的方法就是平移频率的一半，所以得到的结果就是乘以-1的x次方
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