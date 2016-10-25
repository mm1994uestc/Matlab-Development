function varargout = Fire_GUI(varargin)
% FIRE_GUI MATLAB code for Fire_GUI.fig
%      FIRE_GUI, by itself, creates a new FIRE_GUI or raises the existing
%      singleton*.
%
%      H = FIRE_GUI returns the handle to a new FIRE_GUI or the handle to
%      the existing singleton*.
%
%      FIRE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRE_GUI.M with the given input arguments.
%
%      FIRE_GUI('Property','Value',...) creates a new FIRE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fire_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fire_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fire_GUI

% Last Modified by GUIDE v2.5 07-Mar-2016 15:36:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fire_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Fire_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Fire_GUI is made visible.
function Fire_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fire_GUI (see VARARGIN)

% Choose default command line output for Fire_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fire_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fire_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in Buffer_choose.
function Buffer_choose_Callback(hObject, eventdata, handles)
% hObject    handle to Buffer_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.Buffer_choose,'Value')
    case 0
        Adress='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER0\';
    case 1  
        Adress='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER1\';
    case 2
        Adress='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER2\';
    case 3
        Adress='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER3\';
    case 4
        Adress='G:\Math Modeling\Matlab Development\FireDetect\PIC_BUFFER4\';
end
handles.Path1=[Adress,'Fire (1).jpg'];
handles.Path2=[Adress,'Fire (2).jpg'];
handles.Path3=[Adress,'Fire (3).jpg'];
handles.Path4=[Adress,'Fire (4).jpg'];
guidata(hObject,handles);%把数据更新出去以供给其他函数使用
% Hints: contents = cellstr(get(hObject,'String')) returns Buffer_choose contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Buffer_choose


% --- Executes during object creation, after setting all properties.
function Buffer_choose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Buffer_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Begin.
function Begin_Callback(hObject, eventdata, handles)
% hObject    handle to Begin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%读取图像 %
T1=clock;%计时开始
FPS1=imread(handles.Path1);
FPS2=imread(handles.Path2);
FPS3=imread(handles.Path3);
FPS4=imread(handles.Path4);
%二值图像%
%imwrite(I,'image.jpg');%用MATLAB转换图片的格式方法，后缀名不同，输出格式不同
[Fire1,Fire1_Iave]=FZoneExFun(FPS1);
[Fire2,Fire2_Iave]=FZoneExFun(FPS2);
[Fire3,Fire3_Iave]=FZoneExFun(FPS3);
[Fire4,Fire4_Iave]=FZoneExFun(FPS4);
%[S,Boundary,Num]=ShapeClassification(Fire1);
T2=clock;%计时结束
etime(T2,T1)%计算时间

%灰度图像%
Gray1=rgb2gray(FPS1);
Gray2=rgb2gray(FPS2);
Gray3=rgb2gray(FPS3);
Gray4=rgb2gray(FPS4);

%显示图像边缘
% Fire1_Edge=edge(Fire1);%会出现断点，边界图形不封闭
% Fire2_Edge=edge(Fire2);
% Fire3_Edge=edge(Fire3);
% Fire4_Edge=edge(Fire4);
Fire1_Edge=bwperim(Fire1,8);%二维二值图像的边界提取函数bwperim(BW,N),N为边界使用的邻域，取2为2维4邻域  8为2维8邻域，6为3维6邻域，18为3维18邻域
Fire2_Edge=bwperim(Fire2,8);
Fire3_Edge=bwperim(Fire3,8);
Fire4_Edge=bwperim(Fire4,8);
%显示图像%
set(handles.axes1,'visible','off');set(handles.axes2,'visible','off');set(handles.axes3,'visible','off');set(handles.axes4,'visible','off');
set(handles.axes5,'visible','off');set(handles.axes6,'visible','off');set(handles.axes7,'visible','off');set(handles.axes8,'visible','off');
set(handles.axes9,'visible','off');set(handles.axes10,'visible','off');set(handles.axes11,'visible','off');set(handles.axes12,'visible','off');
set(handles.axes13,'visible','off');set(handles.axes14,'visible','off');set(handles.axes15,'visible','off');set(handles.axes16,'visible','off');

axes(handles.axes1);imshow(FPS1);axes(handles.axes2);imshow(Gray1);axes(handles.axes3);imshow(Fire1);axes(handles.axes4);imshow(Fire1_Edge)
axes(handles.axes5);imshow(FPS2);axes(handles.axes6);imshow(Gray2);axes(handles.axes7);imshow(Fire2);axes(handles.axes8);imshow(Fire2_Edge)
axes(handles.axes9);imshow(FPS3);axes(handles.axes10);imshow(Gray3);axes(handles.axes11);imshow(Fire3);axes(handles.axes12);imshow(Fire3_Edge)
axes(handles.axes13);imshow(FPS4);axes(handles.axes14);imshow(Gray4);axes(handles.axes15);imshow(Fire4);axes(handles.axes16);imshow(Fire4_Edge)
clear
% Display(FPS1,Gray1,Fire1,Fire1_Edge,1)%原图像 灰度图像 二值图像 二值边缘提取 排列位置
% %Fire1_Iave%还需要继续完善Gth的数据拟合曲线，亮度和Gth相关结合需要更多的样本
% Display(FPS2,Gray2,Fire2,Fire2_Edge,6)
% %Fire2_Iave
% Display(FPS3,Gray3,Fire3,Fire3_Edge,11)
% %Fire3_Iave
% Display(FPS4,Gray4,Fire4,Fire4_Edge,16)
% %Fire4_Iave

% figure, imshow(Fire1_Edge)
% figure, imshow(Fire2_Edge)
% figure, imshow(Fire3_Edge)
% figure, imshow(Fire4_Edge)


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
