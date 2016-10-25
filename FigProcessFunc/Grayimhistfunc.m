I=imread('rice.png');
[m,n]=size(I);
Max=max(max(I));
Min=min(min(I));
count=zeros(1,Max-Min+1);
k=1;
for grade=Min:Max
   for row=1:m
       for clo=1:n
           if I(row,clo)==grade
             count(k)=count(k)+1;  
           end           
       end
   end
   k=k+1;
end
grade=Min:Max;
subplot(1,2,1)
stem(grade,count)
subplot(1,2,2)
imhist(I)