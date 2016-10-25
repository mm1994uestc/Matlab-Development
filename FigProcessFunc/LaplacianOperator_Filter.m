I=imread('rice.png');
Matrix=[0,1,0;1,-4,1;0,1,0];
I_P=imfilter(I,Matrix);
subplot(1,2,1)
imshow(I_P)
subplot(1,2,2)
imshow(I)