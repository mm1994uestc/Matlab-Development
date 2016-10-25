function Pixel_Find(Pic,x,y)
 if Pic(x,y)==0
     
 else
     Pic(x,y)=0;
     for i=1:3
         for j=1:3
             if Pic(x+i-2,y+j-2)==255
                 Flag=1;
                 break;
             end
         end
         if Flag==1
             break;
         end
     end
     if Flag==1
         Flag=0;
         Pixel_Find(Pic,x+i-2,y+j-2);
     end
 end
end