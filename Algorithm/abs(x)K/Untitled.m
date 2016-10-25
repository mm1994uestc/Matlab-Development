k=0;
x=linspace(-1,1,20);
for n=1:10
    y=x.^k;
    hold on,plot(x,y)
    k=k+0.1;
end
figure
k=0;
for n=1:10
    y1=abs(x.^k);
    hold on,plot(x,y1)
    k=k+0.1;
end
figure
k=0;
x=abs(x);
for n=1:10
    y2=x.^k;
    hold on,plot(x,y2)
    k=k+0.1;
end
figure
k=0;
x=linspace(-1,1,20);
for n=1:10
    y=y1-y2;
    hold on,plot(x,y)
    k=k+0.1;
end