%Image Format Transform
clear all
close all
clc
I=imread('G:\Math Modeling\Matlab Development\Somematerial\PID_Log80x80.png');
imshow(I)
I_gray=rgb2gray(I);
figure,imshow(I_gray)
imwrite(I_gray,'G:\Math Modeling\Matlab Development\Somematerial\Output.jpg','jpg')
imwrite(I_gray,'G:\Math Modeling\Matlab Development\Somematerial\Output.png','png')
imwrite(I_gray,'G:\Math Modeling\Matlab Development\Somematerial\Output.bmp','bmp')
imwrite(I_gray,'G:\Math Modeling\Matlab Development\Somematerial\Output.tiff','tiff')