function [S,Boundary,Num  ] = ShapeClassification(FireZone)%��������������С���Բ����ɵ¿���ĸ�����ⷽ��������rand�������������Ĥ���������ڻ����������Ĥ��ĸ�����ͨ�����ʼ���õ������С
[boundary,L]=bwboundaries(FireZone,'noholes');%��߽���������ͨͼ��
s=regionprops(L, 'centroid'); %����������
dt=regionprops(L, 'area');%���������
x=size(s);%���м���ͼ��
S=dt;
Num=x;
Boundary=boundary;
end

