S1=imread('S.jpg');
imshow(S1)
S2=rgb2gray(S1);
figure,imshow(S2)
[m,n]=size(S2);
t=max(max(S2));%�õ���ֵ�Ĵ�С
for Row=1:m
    for Clo=1:n
        if(S2(Row,Clo)>150)
            S2(Row,Clo)=t;
        else
            S2(Row,Clo)=0;
        end
    end
end
figure,imshow(S2)
H=fspecial('average',5);%����һ���˲�����
S3=imfilter(S2,H);%����һ��3X3�ľ�ֵ�˲�
figure,imshow(S3)
figure,imhist(S3)
Y=zeros(1,n);
X=zeros(1,n);
for Clo=1:n
    for Row=1:m
        if(S3(Row,Clo)>20)
            %Count=0;
           % Y(1,Clo)=Row;
           Y(Clo)=Row;
%            Count=Count+1;
%            Y(Clo)=
%         else
%             S2(Row,Clo)=0;
        end
    end
    X(Clo)=Clo;
end
figure,plot(X,m-Y)
Z=fft(Y);
Z=fftshift(Z);
figure,plot(abs(Z(n/2:n)))  