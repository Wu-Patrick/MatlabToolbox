% =========================================================================
% Copyright:    WZP
% Filename:     imwriteTiffComplex.m
% Description:  
% 
% @author:      wuzhipeng
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   17-Jul-2021 15:41:27
% @version:     Matlab 9.9.0.1467703 (R2020b)
% =========================================================================
%imwriteTiffComplex Save image (m) to a complex-valued Tiff file (output).
% imwriteTiffComplex(m, output) 
% You can use imwriteTiff.m instead of this script.
% 
% note: This script relies on the imwriteTiffComplex.exe, which can combine
% two real-valued tiff files and save them as a complex-valued tiff file.
function imwriteTiffComplex(m, output)

if nargin<1
    help imwriteTiffComplex;
    return;
end

imwriteTiff(real(m),'m_real_tmp.tif');
imwriteTiff(imag(m),'m_imag_tmp.tif');

% cmdstr=['python ' fullfile(fileparts(mfilename('fullpath')),'imwriteTiffComplex.py'),' -r m_real_tmp.tif -i m_imag_tmp.tif -o "',output,'"'];
cmdstr=[fullfile(fileparts(mfilename('fullpath')),'imwriteTiffComplex'),' -r m_real_tmp.tif -i m_imag_tmp.tif -o "',output,'"'];

system(cmdstr);
%eval(cmdstr)

delete 'm_real_tmp.tif';
delete 'm_imag_tmp.tif';

end