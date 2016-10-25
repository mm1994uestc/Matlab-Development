function [] = Display(FPS,Gray,Fire,Fire_Edge,n)%n的输入只能是1或4或7
subplot(4,5,n);
imshow(FPS)
subplot(4,5,n+1);
imshow(Gray)
subplot(4,5,n+2);
imshow(Fire)
subplot(4,5,n+3);
imshow(Fire_Edge)
end

