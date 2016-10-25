%Transform the data.txt file's data into image information
clear all 
close all
clc
%% using the PhotoShop to make a Picture so that i can get the values of the whole picture's data and show them out!
S=imread('G:\Math Modeling\Matlab Development\Somematerial\S_words.jpg');
figure,imshow(S)
[Row,Clo]=size(S);
File=fopen('G:\Math Modeling\Matlab Development\Somematerial\TXTData2IM.txt','wt');
for i=1:Row
    for j=1:Clo
        if j==Clo
            fprintf(File,'%g\n',S(i,j));
        else
            fprintf(File,'%g\t',S(i,j));
        end
    end
end
fclose(File);
TXTData=importdata('G:\Math Modeling\Matlab Development\Somematerial\TXTData2IM.txt');
Im=uint8(TXTData);
figure,imshow(Im)