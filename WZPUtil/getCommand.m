% =========================================================================
% Copyright:    Zhipeng Wu
% Filename:     getCommand.m
% Description:
% 
% @author:      Zhipeng Wu
% @email:       763008300@qq.com
% @website:     https://wuzhipeng.cn/
% @create on:   15-Oct-2020 10:29:15
% @version:     Matlab 9.8.0.1323502 (R2020a)
% =========================================================================
%getCommand Constructs a command from multiple parameters.
% 
% command = getCommand(varargin)
% for example:
%   command = getCommand('copy','a.txt','b.txt');
%   system(command);

function command = getCommand(varargin)
    if nargin<1
        help getCommand;
        return;
    end
    for idx=1:length(varargin)
        varargin{idx}=num2str(varargin{idx});
    end
    command = strjoin(varargin(1:end),' ');
end