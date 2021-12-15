% =========================================================================
% Copyright:    Zhipeng Wu
% Filename:     listdir.m
% Description:
% 
% @author:      Zhipeng Wu
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   13-Mar-2020 21:35:45
% @version:     Matlab 9.4.0.813654 (R2018a)
% =========================================================================
%listdir Lists the files in a folder.
% 
% fileNames = listdir(folder, filter, idx)
% 
% input:
%     folder: must be specified as a character vector or string scalar.
%     filter: Regular expression.
%             Example: '/*.png'
%     idx: return file name of idx
%          if idx<=0, return the full paths of all files.
% output:
%     fileNames: a cell

function fileNames = listdir(folder, filter, idx)

if nargin < 1
    help listdir;
    return;
end
if nargin < 2
    filter = '';
end

if strcmp(filter,'folder')
    d = dir(folder);
    isub = [d(:).isdir]; %# returns logical vector
    files = d(isub);
    files = files(3:end);
else
    files = dir([folder filter]);
end

if nargin == 3
    if idx<=0
        fileNames = fullfile({files.folder},{files.name})';
        fileNames = sort(fileNames);
    else
        fileNames = {files.name}';
        fileNames = fileNames{idx};
    end
else
    fileNames = {files.name}';
    fileNames = sort(fileNames);
end

