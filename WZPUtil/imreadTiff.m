% =========================================================================
% Copyright:    WZP
% Filename:     imreadTiff.m
% Description:  
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   15-Dec-2021 14:55:32
% @version:     Matlab 9.11.0.1769968 (R2021b)
% =========================================================================
%imreadTiff Read image from real-valued or complex-valued Tiff file.
% data = imreadTiff(tiffile)

function data = imreadTiff(tiffile)

%read complex data from tif format
%Reference to the code of luoheng, 14/08/2021

if nargin<1
    help imreadTiff;
    return;
end

% read information
tif_id  = Tiff(tiffile, 'r');
ImageWidth    = tif_id.getTag('ImageWidth');
ImageLength   = tif_id.getTag('ImageLength');
StripOffsets  = tif_id.getTag('StripOffsets');
SampleFormat  = tif_id.getTag('SampleFormat');
tif_id.close();

if SampleFormat<=5
   data = imread(tiffile);
else    
    minV = min(StripOffsets);
    maxV = max(StripOffsets);
    k = (StripOffsets-minV)*(ImageLength-1)/(maxV-minV)+1;
    
    skip_bytes=minV;
    fid=fopen(tiffile,'r');
    fread(fid,skip_bytes,'uchar');
    if SampleFormat==5
        data=fread(fid,[ImageWidth*2 ImageLength],'int32');
    elseif SampleFormat==6
        data=fread(fid,[ImageWidth*2 ImageLength],'float32');
    else
        error(['SampleFormat not supported! SampleFormat=' num2str(SampleFormat)]);
    end
    fclose(fid);
    data=data';
    data=data(:,1:2:end)+data(:,2:2:end)*1i;
    data = data(k,:);
end



