function [ OutImage ] = LocalDensitySeg( InImage ,Win,Thresh)
%对二值图像进行局部密度分割。
[m,n]=size(InImage);
OutImage=zeros(m,n);
for i=Win+1:m-Win
    for j=Win+1:n-Win
        temp=sum(sum(InImage(i-Win:i+Win,j-Win:j+Win)))/(Win+1)/(Win+1);
        if(temp>Thresh)
            OutImage(i,j)=1;
        end
    end
end
end