% =========================================================================
% Copyright:    WZP
% Filename:     imwriteemf.m
% Description:
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   05-Jul-2019 17:09:26
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%imwriteemf Save image (img) to *.emf file (path).
% 
% imwriteemf(img, path, width)
%   img: the image to be saved
%   path: path to save
%   width: the size of the saved image (default: size of img)
% 
% You may need the help of matToGray or matToRGB, for example:
%   imwriteemf(matToGray(img), path, width);
%   imwriteemf(matToRGB(img), path, width);

function imwriteemf(img, path, width)

if nargin<1
    help imwriteemf;
    return;
end

[m,n,~] = size(img);

if nargin<3
    width = m;
end
h = figure('visible','on','MenuBar','none','ToolBar','none');
set (h,'Position',[50,50,width,width/m*n]);  % The first two define the position of the window on the screen, the second two the window size

% Make the image adaptively fill the window
imshow(img,'border','tight','initialmagnification','fit');

saveas(h, path);
close(h);

