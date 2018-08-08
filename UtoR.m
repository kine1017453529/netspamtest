function [ RFeathres ] = UtoR( user,UFeathres )
%UTOR 此处显示有关此函数的摘要
%   此处显示详细说明
N = length(user);
RFeathres=zeros(N,1);
% userS=int(user);

for i=1:N
    RFeathres(i,1)=UFeathres(str2num(char(user{i}))+1,1);
   
%     x=0;


end

