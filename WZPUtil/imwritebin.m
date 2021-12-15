% =========================================================================
% Copyright:    WZP
% Filename:     imwritebin.m
% Description:
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   04-Jul-2019 17:09:26
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%imwritebin Save image (img) to real-valued *.wzp binary file (path).
% 
% imwritebin(img, path);

function imwritebin(matrix, path)
% 保存的数据可以使用python numpy直接读取，但需要使用reshape改变大小
% b = np.fromfile("a.bin")  #从文件中加载数组，错误的dtype会导致错误的结果
% b.reshape(3,4)

if nargin<1
    help imwritebin;
    return;
end

fileID = fopen(path,'wb');
machineformat = 'native';
fwrite(fileID, squeeze(matrix'), 'single', 0, machineformat);
fclose(fileID);