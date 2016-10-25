clear all;clc
I=imread('rice.png');
[m,n]=size(I);
Pic_Big=zeros(m+4,n+4);
Pic_Big(3:m+2,3:n+2)=I;
z=double(Pic_Big);
zz=z;
for y=3:n-2
   for x=3:m-2
      total=0;
      for j=-2:2
         for i=-2:2
             total=total+z((x+i),(y+j));
         end
      end
      total=total/25;
      zz(x,y)=total;
   end
end
Pic=zz(3:m+2,3:n+2);
subplot(1,2,1)
imshow(I);
subplot(1,2,2)
imshow(mat2gray(Pic))