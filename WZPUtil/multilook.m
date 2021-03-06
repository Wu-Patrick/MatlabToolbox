% =========================================================================
% Copyright:    WZP
% Filename:     multilook.m
% Description:
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   11-Dec-2020 17:30:59
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%multilook Multi-look processing of images.
% 
% output = multilook(matrix,multi_az,multi_rg)
%   matrix: the original image
%   multi_az: The number of looks along the row.
%   multi_rg: The number of looks along the column.

function output = multilook(matrix,multi_az,multi_rg)
if nargin<1
    help multilook;
    return;
end

[m,n] = size(matrix);
newm = floor(m/multi_az);
newn = floor(n/multi_rg);
muse = newm*multi_az;
nuse = newn*multi_rg;
output = zeros(newm,newn);

for i = 1:multi_az
    for j=1:multi_rg
        output = output+matrix(i:multi_az:muse,j:multi_rg:nuse);
    end
end
output = output/(multi_az*multi_rg);
end