function varargout = groupprojectGUI(varargin)
% GROUPPROJECTGUI MATLAB code for groupprojectGUI.fig
%      GROUPPROJECTGUI, by itself, creates a new GROUPPROJECTGUI or raises the existing
%      singleton*.
%
%      H = GROUPPROJECTGUI returns the handle to a new GROUPPROJECTGUI or the handle to
%      the existing singleton*.
%
%      GROUPPROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GROUPPROJECTGUI.M with the given input arguments.
%
%      GROUPPROJECTGUI('Property','Value',...) creates a new GROUPPROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before groupprojectGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to groupprojectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help groupprojectGUI

% Last Modified by GUIDE v2.5 27-Apr-2018 12:46:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @groupprojectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @groupprojectGUI_OutputFcn, ...
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


% --- Executes just before groupprojectGUI is made visible.
function groupprojectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to groupprojectGUI (see VARARGIN)

% Choose default command line output for groupprojectGUI
handles.output = hObject;
handles.P = -1
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes groupprojectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = groupprojectGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myh = guidata(hObject);
shares = str2num(myh.quantity);
ticker = myh.symbol;
global shares
global ticker

global loopFlag;
loopFlag = true;
while true
    if(loopFlag == false)
        close(groupproject1);
    end
    disp('Hello');
    groupproject1(handles.quantity, handles.symbol)
    pause(1);
end



% --- Executes on key press with focus on start and none of its controls.
function start_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stopall.
function stopall_Callback(hObject, eventdata, handles)
% hObject    handle to stopall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loopFlag
loopFlag==false;
disp('stopped')



% --- Executes when entered data in editable cell(s) in portfolio.
function portfolio_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to portfolio (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sell_all.
function sell_all_Callback(hObject, eventdata, handles)
% hObject    handle to sell_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
port = IBMatlab('action', 'portfolio');
table = struct2table(port);
symbols = [table.symbol];
symbols = cell2table(symbols);
positions = [table.position];
symbol = 0;
for i = 1:1:length(positions)
    symbol = symbols(i,1);
    if positions(i) > 0
        orderid = IBMatlab('action', 'SELL', 'symbol', symbols(i,1), 'quantity', positions(i), 'type', 'MKT')
    else
        orderid = IBMatlab('action', 'BUY', 'symbol', symbols(i,1), 'quantity', abs(positions(i)), 'type', 'MKT');
    end
end


% --- Executes on button press in refresh.
function refresh_Callback(hObject, eventdata, handles)
% hObject    handle to refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
format bank;
port = IBMatlab('action','portfolio');
table = struct2table(port);
table.PL = (table.marketValue-(table.position .* table.averageCost));
data = table2dataset(table);
set(handles.portfolio,'Data',cell(length(data.position),4), 'rowname', data.symbol);
set(handles.portfolio, 'data', [data.position, data.marketPrice, data.marketValue, data.PL]);



function symbol_Callback(hObject, eventdata, handles)
% hObject    handle to symbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of symbol as text
%        str2double(get(hObject,'String')) returns contents of symbol as a double
handles.symbol = get(hObject,'String');
% Store the handles structure in hObject.
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function symbol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to symbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function quantity_Callback(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of quantity as text
%        str2double(get(hObject,'String')) returns contents of quantity as a double
handles.quantity = get(hObject,'String');
% Store the handles structure in hObject.
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function quantity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
