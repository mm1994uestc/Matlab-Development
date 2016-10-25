%recursion  function [s,Iaverage] = FZoneExFun(FPS)
function R=Recursion(n)
 if n==1
    R=1;
 else
    R=n*Recursion(n-1);
 end
end
%The Thinking of C Language
% double function2(double matrix[][],int n)
% {
%     int i=0;
%     double matrix1[][];
%     if(n==1)
%     {
%         return result;
%     }else
%     {
%         for(i=0;i<n;i++)
%         {
%             matrix1[][]=matric[][]//ÇÐ¸î¾ØÕó
%             if(i%2==0)
%             {
%                 k=1;
%             }else
%             {
%                 k=-1;
%             }
%             sum+=k*matrix[0][i]*function2(matrix1,n-1);
%         }
%         return sum;
%     }
% }