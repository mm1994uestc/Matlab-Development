%While 方法寻找边缘轮廓 采用4邻域方式
function [Pic_Process,C]=Pixel_Search(Pic,Row,Clo,m,n)
    While_Flag=1;
    C=1;%周长像素点计数
    Pic_Process=zeros(m,n);%模板建立
    Pic_Buffer=Pic;%图像缓存建立
    while (While_Flag==1)%while循环判断
        C=C+1;
        Pic_Process(Row,Clo)=1;%图像模板区域置位
        Pic_Buffer(Row,Clo)=0;%图像缓冲区域清零
        
        if Clo<=1 || Row>m || Clo>n || Row<=1%防止图像检测过程中，边缘溢出
            break;
        end
        
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
end