function A=zhixin(x1,x2,y1,y2,I) %�������ĵ�����
%x1��x2 �����������
%y1,y2 �����������
%I ������ľ��󣬸þ��������һ��������������ͼ��
%���������
h1=0;h2=0;
for x=x1:x2
    for y=y1:y2
      h1=h1+x*I(x,y);
        h2=h2+I(x,y);
    end
end
A(1,1)=h1/h2;
%���������
l1=0;l2=0;
for x=x1:x2
    for y=y1:y2
      l1=l1+y*I(x,y);
        l2=l2+I(x,y);
    end
end
A(1,2)=l1/l2;




