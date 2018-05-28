function [timestamp,pos_x,pos_y,pos_z,q_w,q_x,q_y,q_z] = optitracktomat(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ��ʸ�����롣
%   [TIMESTAMP,POS_X,POS_Y,POS_Z,Q_W,Q_X,Q_Y,Q_Z] = IMPORTFILE(FILENAME)
%   ��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%
%   [TIMESTAMP,POS_X,POS_Y,POS_Z,Q_W,Q_X,Q_Y,Q_Z] = IMPORTFILE(FILENAME,
%   STARTROW, ENDROW) ��ȡ�ı��ļ� FILENAME �� STARTROW �е� ENDROW ���е����ݡ�
%
% Example:
%   [timestamp,pos_x,pos_y,pos_z,q_w,q_x,q_y,q_z] = importfile('gt-1.txt',1, 10208);
%
%    ������� TEXTSCAN��

% �� MATLAB �Զ������� 2018/05/25 16:08:15

%% ��ʼ��������
delimiter = ' ';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% ÿ���ı��еĸ�ʽ:
%   ��1: ˫����ֵ (%f)
%	��2: ˫����ֵ (%f)
%   ��3: ˫����ֵ (%f)
%	��4: ˫����ֵ (%f)
%   ��5: ˫����ֵ (%f)
%	��6: ˫����ֵ (%f)
%   ��7: ˫����ֵ (%f)
%	��8: ˫����ֵ (%f)
% �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
formatSpec = '%f%f%f%f%f%f%f%f%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ��ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% �ر��ı��ļ���
fclose(fileID);

%% ���޷���������ݽ��еĺ���
% �ڵ��������δӦ���޷���������ݵĹ�����˲�����������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���

%% ����������������б�������
timestamp = dataArray{:, 1};
pos_x = dataArray{:, 2};
pos_y = dataArray{:, 3};
pos_z = dataArray{:, 4};
q_w = dataArray{:, 5};
q_x = dataArray{:, 6};
q_y = dataArray{:, 7};
q_z = dataArray{:, 8};


