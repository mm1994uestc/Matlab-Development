%While ����Ѱ�ұ�Ե���� ����4����ʽ
function [Pic_Process,C]=Pixel_Search(Pic,Row,Clo,m,n)
    While_Flag=1;
    C=1;%�ܳ����ص����
    Pic_Process=zeros(m,n);%ģ�彨��
    Pic_Buffer=Pic;%ͼ�񻺴潨��
    while (While_Flag==1)%whileѭ���ж�
        C=C+1;
        Pic_Process(Row,Clo)=1;%ͼ��ģ��������λ
        Pic_Buffer(Row,Clo)=0;%ͼ�񻺳���������
        
        if Clo<=1 || Row>m || Clo>n || Row<=1%��ֹͼ��������У���Ե���
            break;
        end
        
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
end