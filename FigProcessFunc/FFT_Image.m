%fft for 2D image
 I=zeros(1024);
 I(460:564,460:564)=1;
%I=imread('rice.png');
[m,n]=size(I);
% subplot(2,2,1)
% imshow(I)
%I=double(I);
for Row=1:m%相当于做一次FFTshift
    for Clo=1:n
        I(Row,Clo)=I(Row,Clo)*((-1)^(Row+Clo-2));
    end
end
Fre=fft2(I);
I_r=ifft2(Fre);
for Row=1:m%相当于做一次IFFTshift
    for Clo=1:n
        I_r(Row,Clo)=I_r(Row,Clo)*((-1)^(Row+Clo-2));
    end
end
Fre=abs(Fre);
%subplot(2,2,2),mesh(I)
%subplot(2,2,2),imshow(I_r)
%subplot(2,2,3),mesh(Fre)
%subplot(2,2,4),imshow(Fre,[])
%C = gradient(log(Fre+1));
Fre_Press=log(Fre+1);
mesh(Fre_Press);
axis([0 1100 0 1100 0 10]);
view([1100,1100,10000])
%figure,count(double(Fre_Press))
