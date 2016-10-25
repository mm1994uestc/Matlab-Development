function []=FFT()
%一维FFT变换函数：F=ftt(f);F_0=fftshift(F);imshow(F_0)
PIC_BW=zeros(100,100);%experiment1
PIC_BW(40:60,20:80)=1;%创建掩膜

PIC_FFT2=fft2(PIC_BW);%直接对图像进行二维空间傅里叶变换

PIC_FFT2_Shift=fftshift(PIC_FFT2);%该函数可以交换FFT处理后结果的象限，将0频率系数移动到中心位置
PIC_FFT2_Shift=log(abs(PIC_FFT2_Shift));

PIC_FFT2=log(abs(PIC_FFT2));%对傅里叶结果取绝对值（即求得空间傅里叶幅度频谱），取对数的原因是因为这样会让傅里叶结果更清楚的显示

M=120;N=120;
PIC_FFT2_MN=fft2(PIC_BW,M,N);%fft2(X,m,n)能够让输出的图像的尺寸为m*n的大小，当m*n小于原图像时，进行裁剪，相反进行补零来扩大图像
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
% colormap(jet);%设置色彩索引图
 colorbar;
end%FFT变换
function []=DCT()
%B=idct(A)二维离散余弦逆变换，B的大小与A相同，各元素为离散余弦变换的系数B(k1,k2)
%B=idct(A,m,n)B的大小为mXn，在做DCT变换之前，先对图像A补零或者剪切
%DCT变换一般用于图像的压缩重构，在JPG的图像压缩算法中，图像被分成8X8或者16X16的图像块，然后对每个图像块进行DCT变换。DCT变换被量化、编码及传输，
%在接收端量化的DCT系数被解码，并用来计算每个图像块的DCT逆变换，最后图像拼接。
I=imread('G:\Math Modeling\Matlab Development\ImageTransform\1.jpg');%experiment1
J=rgb2gray(I);
K=dct2(J);
subplot(1,3,1)
imshow(J)
subplot(1,3,2)
imshow(log(abs(K)),[]); colormap(jet(64)),colorbar
K(abs(K)<50)=0;%将DCT变换值小于10的元素设置为0，从而有规则地减少图片的信息量，压缩图像
G=idct2(K);%idct2逆变换
subplot(1,3,3)
imshow(G,[0 255])%

A=im2double(imread('rice.png'));%experiment2--读入图片并对图片进行数据转型处理，得到double型数据
D=dctmtx(size(A,1));%D=dctmtx(n)返回nXn的DCT变换矩阵，矩阵A的大小为nXn，D*A是A矩阵每一列的DCT变换值（A是nxn方阵）。
dct=D*A*D';%用D*A*D'的方法实现DCT变换要比直接使用dct2(A)变换更快一些
figure,imshow(dct)
end%DCF离散余弦变换
function []=CONV()
%两个向量的卷积运算
conv([1 2 1],[3 2 6])%experiment1
%快速卷积的方法%
A=magic(3);%experiment2
B=ones(3);
A(8,8)=0;%为了进行快速卷积，需要对A和B进行补零构成同型矩阵才能运算
B(8,8)=0;
C=ifft2(fft2(A).*fft2(B));%时域（空间域）的卷积运算转换为频域的乘积运算，fft乘积运算之后再进ifft就可以的到卷积结果
C=C(1:5,1:5);%取有用的运算结果
C=real(C)%显示出实部
end%卷积运算&快速卷积运算