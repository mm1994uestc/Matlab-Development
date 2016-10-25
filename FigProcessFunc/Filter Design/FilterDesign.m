%滤波器频率响应计算和显示%
figure
A=fspecial('gaussian');%建立滤波矩阵
freqz2(A)%计算并显示参数
figure
B=fspecial('average',5);%创建一个滤波矩阵
freqz2(B)

%对图像的处理方式%
figure
PIC=imread('G:\Math Modeling\Matlab Development\Filter Design\Image.bmp');
PIC_Deal=imfilter(PIC,B);
subplot(1,2,1)
imshow(PIC)
subplot(1,2,2)
imshow(PIC_Deal)
%S3=imfilter(S2,H);%对图像进行一次3X3的均值滤波