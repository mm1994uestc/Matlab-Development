%test.file
%The size of the window is 3*3
I=imread('rice.png');
imshow(I);

% I=imnoise(I,'salt & pepper',0.02);
% figure,imshow(I);
% [m,n]=size(I);
% I_big=zeros(m+2,n+2);
% I_big(2:m+1,2:n+1)=I;
% I_Process=I;
% for Row=2:m+1
%     for Clo=2:n+1
%         %I_Process(Row-1,Clo-1)=(I_big(Row-1,Clo-1)+I_big(Row,Clo-1)+I_big(Row+1,Clo-1)+I_big(Row-1,Clo)+I_big(Row,Clo)+I_big(Row+1,Clo)+I_big(Row-1,Clo+1)+I_big(Row,Clo+1)+I_big(Row+1,Clo+1))/9;%采用均值滤波的方法
%         I_Process(Row-1,Clo-1)=exp((1/9)*log(I_big(Row-1,Clo-1)*I_big(Row,Clo-1)*I_big(Row+1,Clo-1)*I_big(Row-1,Clo)*I_big(Row,Clo)*I_big(Row+1,Clo)*I_big(Row-1,Clo+1)*I_big(Row,Clo+1)*I_big(Row+1,Clo+1)));%Arithmetic mean filter or moving average filter,如何对一个数字开N次方，用exp(log(?)),Example:对N开M次方--相当于：exp((1/M)*log(N))
%     end
% end
% figure,imshow(I_Process)

I_FFT=fft2(I);
[m,n]=size(I_FFT);
I_FilterFFT=ones(m,n);
for Row=1:m
    for Clo=1:n
        I_FilterFFT(Row,Clo)=I_FFT(Row,Clo)*exp(exp(5*log(Row^2+Clo^2)/6))*0.0025;
    end
end
I_Filter=ifft2(I_FilterFFT);
figure,imshow(I_Filter);
[u,v]=meshgrid(-10:0.1:10);
H=exp(exp(5*log(u.^2+v.^2)/6));
figure,mesh(H)