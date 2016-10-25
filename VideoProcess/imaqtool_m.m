%imaqtool工具箱使用
vid = videoinput('winvideo', 1, 'MJPG_320x240');
src = getselectedsource(vid);
vid.FramesPerTrigger = 1;
%vid.source=rgb2gray(vid.source);
preview(vid);
%stoppreview(vid);