%%sounds process,������MATLAB�Ŀ⺯��fft(),�ٶ��൱���ˣ�����
[S,FS] = wavread('G:\Math Modeling\Matlab Development\�ز�\yes.wav');%����һ����Ƶ�ź�
wavplay(S,FS)%������Ƶ�ź�audioplayer
Num=size(S);%�����ܵĲ�������
Num=Num(1);%ȡ��S�Ĳ�������
S_DFT=fft(S);%���п��ٸ���Ҷ�任
S_DFT=abs(fftshift(S_DFT));%fft����ƽ���Լ����FFT����
Delta_F=FS/(2*Num);%����Ƶ�ʼ��
K=Num/2;
Fre_X=0:K;%������Ӧ��x����ľ���
Fre_X=Fre_X*Delta_F;%����x�����Ƶ����ֵ
S_DFT=S_DFT(K:Num);%��ȡ��ȷ�Ĳ��ζ�
plot(Fre_X,S_DFT)
ylabel('����-V')
xlabel('Ƶ��-HZ')