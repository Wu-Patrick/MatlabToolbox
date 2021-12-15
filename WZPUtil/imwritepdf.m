% =========================================================================
% Copyright:    WZP
% Filename:     imwritepdf.m
% Description:
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   05-Jul-2019 17:09:26
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%imwritepdf Save image (img) to *.pdf file (path).
% 
% imwritepdf(img, path, caxisV)
%   img: the image to be saved
%   path: path to save
%   caxisV: the two element vector [cmin cmax]. cmin and cmax are assigned
%   to the first and last colors in the current colormap.

function imwritepdf(matrix, path, caxisV)

if nargin<1
    help imwritepdf;
    return;
end

h = figure('visible','off');
% set (h,'Position',[50,50,width,width/m*n]);  % The first two define the position of the window on the screen, the second two the window size

% Make the image adaptively fill the window
% imshow(matrix,'border','tight','initialmagnification','fit');
imagesc(matrix);
colormap jet;
colorbar;
axis square;

if nargin==3 && ~isempty(caxisV)
    caxis(caxisV);
end

saveas(h, path);
close(h);

