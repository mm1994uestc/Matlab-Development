function [ OutImage ] = LocalDensitySeg( InImage ,Win,Thresh)
%�Զ�ֵͼ����оֲ��ܶȷָ
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