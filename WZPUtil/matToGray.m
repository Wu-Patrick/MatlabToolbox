% =========================================================================
% Copyright:    WZP
% Filename:     matToGray.m
% Description:  
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   12-Jun-2020 18:47:59
% @version:     Matlab 9.4.0.813654 (R2018a)
% =========================================================================
%matToGray Convert matrix to intensity image.
% 
% I = matToGray(G, caxisV) 
%   converts the matrix G to the intensity image I.
%   The returned matrix I contains values in the range 0 (black) to 255 (full
%   intensity or white).  caxisV: the two element vector [cmin cmax]. 
%   cmin and cmax are the values in G that correspond to 0 and 255 in I.  
%   Values less than cmin become 0, and values greater than cmax become 255.


function I = matToGray(G, caxisV)

if nargin<1
    help matToGray;
    return;
end

if nargin == 2 && caxisV(1) ~= caxisV(2)
    cmin = caxisV(1);
    cmax = caxisV(2);
else    
    cmin = min(G(:));
    cmax = max(G(:));
end

G(G>cmax) = cmax;
G(G<cmin) = cmin;

if cmax == cmin
    I = ones(size(G));
else
    I = (G - cmin) / (cmax - cmin);
end
I = uint8(I*255);