%�˲���Ƶ����Ӧ�������ʾ%
figure
A=fspecial('gaussian');%�����˲�����
freqz2(A)%���㲢��ʾ����
figure
B=fspecial('average',5);%����һ���˲�����
freqz2(B)

%��ͼ��Ĵ���ʽ%
figure
PIC=imread('G:\Math Modeling\Matlab Development\Filter Design\Image.bmp');
PIC_Deal=imfilter(PIC,B);
subplot(1,2,1)
imshow(PIC)
subplot(1,2,2)
imshow(PIC_Deal)
%S3=imfilter(S2,H);%��ͼ�����һ��3X3�ľ�ֵ�˲�