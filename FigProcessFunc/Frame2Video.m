%Frame convert to  Video
WriterObj=VideoWriter('Video.avi');
open(WriterObj);
temp1='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\Fire (';
temp2=').jpg';
for F=1:300
    Path1=strcat(temp1,num2str(F),temp2);
    FPS1=imread(Path1);
    writeVideo(WriterObj,FPS1);
end
close(WriterObj);