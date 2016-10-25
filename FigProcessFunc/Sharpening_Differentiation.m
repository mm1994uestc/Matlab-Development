clear all;clc
I=imread('rice.png');
[m,n]=size(I);
I_Processx=I;
I_Processy=I;
for Row=1:m
    for Clo=1:n-1
        I_Processx(Row,Clo)=I(Row,Clo)-I(Row,Clo+1);
    end
end
for Row=1:m-1
    for Clo=1:n
        I_Processy(Row,Clo)=I(Row,Clo)-I(Row+1,Clo);
    end
end
I_Plus=I;
I_Sqrt=I;
for Row=1:m
    for Clo=1:n
        I_Plus(Row,Clo)=abs(I_Processy(Row,Clo))+abs(I_Processx(Row,Clo));
        I_Sqrt(Row,Clo)=sqrt((double(I_Processy(Row,Clo)))^2+(double(I_Processx(Row,Clo)))^2);
    end
end
subplot(2,3,1)
imshow(I_Processx)
subplot(2,3,2)
imshow(I_Processy)
subplot(2,3,3)
imshow(I)
subplot(2,3,4)
imshow(I_Plus)
subplot(2,3,5)
imshow(mat2gray(I_Sqrt))