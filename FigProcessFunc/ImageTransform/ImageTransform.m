function []=FFT()
%һάFFT�任������F=ftt(f);F_0=fftshift(F);imshow(F_0)
PIC_BW=zeros(100,100);%experiment1
PIC_BW(40:60,20:80)=1;%������Ĥ

PIC_FFT2=fft2(PIC_BW);%ֱ�Ӷ�ͼ����ж�ά�ռ丵��Ҷ�任

PIC_FFT2_Shift=fftshift(PIC_FFT2);%�ú������Խ���FFT������������ޣ���0Ƶ��ϵ���ƶ�������λ��
PIC_FFT2_Shift=log(abs(PIC_FFT2_Shift));

PIC_FFT2=log(abs(PIC_FFT2));%�Ը���Ҷ���ȡ����ֵ������ÿռ丵��Ҷ����Ƶ�ף���ȡ������ԭ������Ϊ�������ø���Ҷ������������ʾ

M=120;N=120;
PIC_FFT2_MN=fft2(PIC_BW,M,N);%fft2(X,m,n)�ܹ��������ͼ��ĳߴ�Ϊm*n�Ĵ�С����m*nС��ԭͼ��ʱ�����вü����෴���в���������ͼ��
PIC_FFT2_MN=log(abs(PIC_FFT2_MN));

figure
subplot(1,4,1) 
imshow(PIC_BW)
subplot(1,4,2) 
imshow(PIC_FFT2)
subplot(1,4,3) 
imshow(PIC_FFT2_MN)
subplot(1,4,4)
imshow(PIC_FFT2_Shift)
% colormap(jet);%����ɫ������ͼ
 colorbar;
end%FFT�任
function []=DCT()
%B=idct(A)��ά��ɢ������任��B�Ĵ�С��A��ͬ����Ԫ��Ϊ��ɢ���ұ任��ϵ��B(k1,k2)
%B=idct(A,m,n)B�Ĵ�СΪmXn������DCT�任֮ǰ���ȶ�ͼ��A������߼���
%DCT�任һ������ͼ���ѹ���ع�����JPG��ͼ��ѹ���㷨�У�ͼ�񱻷ֳ�8X8����16X16��ͼ��飬Ȼ���ÿ��ͼ������DCT�任��DCT�任�����������뼰���䣬
%�ڽ��ն�������DCTϵ�������룬����������ÿ��ͼ����DCT��任�����ͼ��ƴ�ӡ�
I=imread('G:\Math Modeling\Matlab Development\ImageTransform\1.jpg');%experiment1
J=rgb2gray(I);
K=dct2(J);
subplot(1,3,1)
imshow(J)
subplot(1,3,2)
imshow(log(abs(K)),[]); colormap(jet(64)),colorbar
K(abs(K)<50)=0;%��DCT�任ֵС��10��Ԫ������Ϊ0���Ӷ��й���ؼ���ͼƬ����Ϣ����ѹ��ͼ��
G=idct2(K);%idct2��任
subplot(1,3,3)
imshow(G,[0 255])%

A=im2double(imread('rice.png'));%experiment2--����ͼƬ����ͼƬ��������ת�ʹ����õ�double������
D=dctmtx(size(A,1));%D=dctmtx(n)����nXn��DCT�任���󣬾���A�Ĵ�СΪnXn��D*A��A����ÿһ�е�DCT�任ֵ��A��nxn���󣩡�
dct=D*A*D';%��D*A*D'�ķ���ʵ��DCT�任Ҫ��ֱ��ʹ��dct2(A)�任����һЩ
figure,imshow(dct)
end%DCF��ɢ���ұ任
function []=CONV()
%���������ľ������
conv([1 2 1],[3 2 6])%experiment1
%���پ���ķ���%
A=magic(3);%experiment2
B=ones(3);
A(8,8)=0;%Ϊ�˽��п��پ������Ҫ��A��B���в��㹹��ͬ�;����������
B(8,8)=0;
C=ifft2(fft2(A).*fft2(B));%ʱ�򣨿ռ��򣩵ľ������ת��ΪƵ��ĳ˻����㣬fft�˻�����֮���ٽ�ifft�Ϳ��Եĵ�������
C=C(1:5,1:5);%ȡ���õ�������
C=real(C)%��ʾ��ʵ��
end%�������&���پ������