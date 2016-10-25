function A=zhixin(x1,x2,y1,y2,I) %计算质心的坐标
%x1，x2 矩阵的行坐标
%y1,y2 矩阵的列坐标
%I 被计算的矩阵，该矩阵必须是一个仅有两个光点的图像
%行坐标计算
h1=0;h2=0;
for x=x1:x2
    for y=y1:y2
      h1=h1+x*I(x,y);
        h2=h2+I(x,y);
    end
end
A(1,1)=h1/h2;
%列坐标计算
l1=0;l2=0;
for x=x1:x2
    for y=y1:y2
      l1=l1+y*I(x,y);
        l2=l2+I(x,y);
    end
end
A(1,2)=l1/l2;




