function [S,Boundary,Num  ] = ShapeClassification(FireZone)%火焰区域的面积大小可以采用蒙德卡洛的概率求解方法，利用rand函数生成随机掩膜，计算落在火焰区域的掩膜点的个数，通过概率计算得到面积大小
[boundary,L]=bwboundaries(FireZone,'noholes');%求边界坐标与连通图形
s=regionprops(L, 'centroid'); %求中心坐标
dt=regionprops(L, 'area');%求区域面积
x=size(s);%求有几个图形
S=dt;
Num=x;
Boundary=boundary;
end

