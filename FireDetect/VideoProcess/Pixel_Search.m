%While ����Ѱ�ұ�Ե���� ����4����ʽ
function [Pic_Process,C,S_ROI,H]=Pixel_Search(Pic,Row,Clo,m,n)
    While_Flag=1;
    C=1;%�ܳ����ص����
    H=0;
    S_ROI=0;%��ʼ��Ϊ0
    %S_Tri=0;%��ʼ��Ϊ0
    Pic_Process=zeros(m,n);%ģ�彨��
    Pic_Buffer=Pic;%ͼ�񻺴潨��
%     Triangel_A=[Row,Clo];%�������ߵ㣬Ҳ�Ǽ�������������Ķ���
%     Triangel_B=Triangel_A;%��ʼ��
%     Triangel_C=Triangel_A;%��ʼ��
%     H_Compare=Triangel_A(1);
    while (While_Flag==1)%whileѭ���ж�
        C=C+1;
        Pic_Process(Row,Clo)=1;%ͼ��ģ��������λ
        Pic_Buffer(Row,Clo)=0;%ͼ�񻺳���������
        
        if Clo<=1 || Row>m || Clo>n || Row<=1%��ֹͼ��������У���Ե���
            break;
        end
        
%         if H_Compare<=Row
%             H_Compare=Row;
%         end
        %��֪�����ε�����������������ε�����ļ��㹫ʽ������-A(a,b);B(c,d);C(e,f)
        %��ʽ��S_Tri=(ad��be��cf��af��bc��de)/2,��Ȼ����и��õļ��㷽��Ҳ���Լ���������������ٶ�
%         if mod(C,10)==0%ÿ��5�����ص����һ�μ��㣬�����õ��������и�֮������������ԽС�������ȷ��Խ�ߣ����Ǽ�����Խ�����Ҫѡ���ʵ���
%             Triangel_B=Triangel_C;%�洢��һ������
%             Triangel_C=[Row,Clo];%�洢���µ�����
%             S_Tri=(Triangel_A(1)*(Triangel_B(2)-Triangel_C(2))+Triangel_A(2)*(Triangel_C(1)-Triangel_B(1)) ... 
%                   +Triangel_B(1)*Triangel_C(2)-Triangel_B(2)*Triangel_C(1))/2;%����ʹ����matlab��һ����任��ִ��
%             S_ROI=S_ROI+S_Tri;%�������
%         end
        
        if Pic_Buffer(Row,Clo-1)==1%ѭ���ж�������
            Clo=Clo-1;
            While_Flag=1;
        else if Pic_Buffer(Row+1,Clo)==1%ѭ���ж�������
                Row=Row+1; 
                While_Flag=1;
            else if Pic_Buffer(Row,Clo+1)==1%ѭ���ж�������
                    Clo=Clo+1;
                    While_Flag=1;
                else if Pic_Buffer(Row-1,Clo)==1%ѭ���ж�������
                        Row=Row-1; 
                        While_Flag=1;
                    else
                        While_Flag=0;%����ѭ�������������㣬���������ӵ���Χû�б�Ե���أ���������whileѭ������������
                    end
                end
            end
        end
    end
%     H=abs(H_Compare-Triangel_A(1));%������߶�
end