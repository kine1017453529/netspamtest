function [ RFeathres ] = UtoR( user,UFeathres )
%UTOR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N = length(user);
RFeathres=zeros(N,1);
% userS=int(user);

for i=1:N
    RFeathres(i,1)=UFeathres(str2num(char(user{i}))+1,1);
   
%     x=0;


end

