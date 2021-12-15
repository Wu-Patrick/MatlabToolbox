% =========================================================================
% Copyright:    WZP
% Filename:     wzpToPng.m
% Description:
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   17-Dec-2020 20:54:37
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%wzpToPng Batch convert *.wzp files in wzpFolder to *.png files in pngFolder.
% 
% wzpToPng(wzpFolder,pngFolder,Num,rows,cols)
%   wzpFolder: The folder containing the *.wzp.
%   pngFolder: The folder containing the *.png.
%   Num: Number of files to be converted.
%   rows: rows of the *.wzp.
%   cols: cols of the *.wzp.

function wzpToPng(wzpFolder,pngFolder,Num,rows,cols)
if nargin<1
    help wzpToPng;
    return;
end

if nargin<3
    Num = 0;
end
if nargin<4
    rows = 180;
end
if nargin<5
    cols = 180;
end

if isfolder(wzpFolder)
    if ~exist(pngFolder,'dir');mkdir(pngFolder);end
    fileNames = listdir(wzpFolder,'/*.wzp');
    allNum = length(fileNames);
    if Num>0 && Num<=allNum
        allNum = Num;
    end
    for fidx = 1:allNum
        fileName = fileNames{fidx};
        disp(fileName);
        
        img = imreadbin(fullfile(wzpFolder,fileName),rows,cols);
        imwrite(matToRGB(img),fullfile(pngFolder,changeSuffix(fileName,'.png','.wzp')));
    end
else
    disp(wzpFolder);
    img = imreadbin(wzpFolder,rows,cols);
    imwrite(matToRGB(img),pngFolder);
end

disp('Over!');

end