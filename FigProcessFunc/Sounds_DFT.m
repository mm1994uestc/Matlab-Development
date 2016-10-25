%%sounds process,采用了MATLAB的库函数fft(),速度相当惊人！！！
[S,FS] = wavread('G:\Math Modeling\Matlab Development\素材\yes.wav');%读入一个音频信号
wavplay(S,FS)%播放音频信号audioplayer
Num=size(S);%计算总的采样点数
Num=Num(1);%取出S的采样点数
S_DFT=fft(S);%进行快速傅里叶变换
S_DFT=abs(fftshift(S_DFT));%fft中心平移以及求出FFT幅度
Delta_F=FS/(2*Num);%计算频率间隔
K=Num/2;
Fre_X=0:K;%创建对应的x坐标的矩阵
Fre_X=Fre_X*Delta_F;%计算x坐标的频率数值
S_DFT=S_DFT(K:Num);%截取正确的波形段
plot(Fre_X,S_DFT)
ylabel('幅度-V')
xlabel('频率-HZ')