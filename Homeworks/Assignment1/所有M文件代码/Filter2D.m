%% using ps to make a pic like item request,then output the data and show it.We also need the filter2 with 2 demosion to make the pic be smooth.
clear all
close all
clc
Im=imread('G:\Math Modeling\Matlab Development\Somematerial\Circle_Data.tif');
imshow(Im)
Ave=ones(32,32);
Im_filter=imfilter(Im,Ave);
figure,imshow(Im_filter)