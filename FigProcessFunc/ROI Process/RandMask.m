% x=100*rand(1,4);
% y=100*rand(1,4);
% x(end+1)=x(1);
% y(end+1)=y(1);
% bw=poly2mask(x,y,100,100);
% imshow(bw)
% hold on
% plot(x,y,'g','LineWidth',6)
% hold off
%
m=100;n=100;
Rand_Mask=rand(m,n);
I_Count=0;
for Row=1:m
    for Clo=1:n
        if (Rand_Mask(Row,Clo)>=0.5)
            Rand_Mask(Row,Clo)=255;
            I_Count=I_Count+1;
        else 
            Rand_Mask(Row,Clo)=0;
        end
    end
end
imshow(Rand_Mask)
Percent=I_Count/(m*n)