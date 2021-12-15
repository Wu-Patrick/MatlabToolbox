% =========================================================================
% Copyright:    WZP
% Filename:     imwriteTiff.m
% Description:  
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   12-Jun-2020 18:47:59
% @version:     Matlab 9.4.0.813654 (R2018a)
% =========================================================================
%imwriteTiff Save image (matrix) to a Tiff file (path), supporting 
% real-valued or complex-valued matrix.
% 
% imwriteTiff(matrix, path)

% save float Tiff
function imwriteTiff(matrix, path)
% save float mat to tiff, i.e. *.tif
% imwriteTiff(matrix, path)

if nargin<1
    help imwriteTiff;
    return;
end

if ~isreal(matrix)
    imwriteTiffComplex(matrix,path);
    return;
end

assert(isreal(matrix),'cannot save complex tiff');
matrix = single(matrix);

% This is a direct interface to libtiff
t = Tiff(path,'w');

% Setup tags
% Lots of info here:
% http://www.mathworks.com/help/matlab/ref/tiffclass.html
tagstruct.ImageLength     = size(matrix,1);
tagstruct.ImageWidth      = size(matrix,2);
tagstruct.SampleFormat    = Tiff.SampleFormat.IEEEFP;
tagstruct.BitsPerSample   = 32;
tagstruct.SamplesPerPixel = 1;
tagstruct.Photometric     = Tiff.Photometric.MinIsBlack;
tagstruct.RowsPerStrip    = 16;
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
tagstruct.Software        = 'MATLAB';
t.setTag(tagstruct)


t.write(matrix);
t.close();
