%Height of fire caculate for DFT
Height=[37 44 57 66 62 66 74 84 77 85 93 99 99 81 81 85 83 100 112 120 109 114 121 117 103 104 104 108 115 114 129 105 105 95 110 117 116 123 104];
stem(Height)
% Fre=abs(fftshift(fft(Height)));
% figure,plot(Fre)
Fre=MyDFT(Height);
figure,plot(Fre)