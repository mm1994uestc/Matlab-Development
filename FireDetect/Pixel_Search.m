%While 方法寻找边缘轮廓 采用4邻域方式
function [Pic_Process,C,S_ROI,H]=Pixel_Search(Pic,Row,Clo,m,n)
    While_Flag=1;
    C=1;%周长像素点计数
    H=0;
    S_ROI=0;%初始化为0
    %S_Tri=0;%初始化为0
    Pic_Process=zeros(m,n);%模板建立
    Pic_Buffer=Pic;%图像缓存建立
%     Triangel_A=[Row,Clo];%区域的最高点，也是计算三角形面积的顶点
%     Triangel_B=Triangel_A;%初始化
%     Triangel_C=Triangel_A;%初始化
%     H_Compare=Triangel_A(1);
    while (While_Flag==1)%while循环判断
        C=C+1;
        Pic_Process(Row,Clo)=1;%图像模板区域置位
        Pic_Buffer(Row,Clo)=0;%图像缓冲区域清零
        
        if Clo<=1 || Row>m || Clo>n || Row<=1%防止图像检测过程中，边缘溢出
            break;
        end
        
%         if H_Compare<=Row
%             H_Compare=Row;
%         end
        %已知三角形的三个顶点求解三角形的面积的计算公式：顶点-A(a,b);B(c,d);C(e,f)
        %公式：S_Tri=(ad＋be＋cf－af－bc－de)/2,当然如果有更好的计算方法也可以加入其中提高运行速度
%         if mod(C,10)==0%每隔5个像素点进行一次计算，这样得到三角形切割之后的面积（除数越小，面积精确度越高，但是计算量越大，因此要选择适当）
%             Triangel_B=Triangel_C;%存储上一组数据
%             Triangel_C=[Row,Clo];%存储最新的数据
%             S_Tri=(Triangel_A(1)*(Triangel_B(2)-Triangel_C(2))+Triangel_A(2)*(Triangel_C(1)-Triangel_B(1)) ... 
%                   +Triangel_B(1)*Triangel_C(2)-Triangel_B(2)*Triangel_C(1))/2;%这里使用了matlab的一条语句换行执行
%             S_ROI=S_ROI+S_Tri;%更新面积
%         end
        
        if Pic_Buffer(Row,Clo-1)==1%循环判断区域结果
            Clo=Clo-1;
            While_Flag=1;
        else if Pic_Buffer(Row+1,Clo)==1%循环判断区域结果
                Row=Row+1; 
                While_Flag=1;
            else if Pic_Buffer(Row,Clo+1)==1%循环判断区域结果
                    Clo=Clo+1;
                    While_Flag=1;
                else if Pic_Buffer(Row-1,Clo)==1%循环判断区域结果
                        Row=Row-1; 
                        While_Flag=1;
                    else
                        While_Flag=0;%各个循环条件都不满足，即像素种子点周围没有边缘像素，即可跳出while循环，结束搜索
                    end
                end
            end
        end
    end
%     H=abs(H_Compare-Triangel_A(1));
end