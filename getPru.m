function [ Pru ] = getPru( Pruv )
%GETPRU �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N=size(Pruv,1);
Pru = ones(N,1);
for i=1:N
    sum =0;
    for j=1:N
        sum=sum+Pruv(i,j);
    end
    Pru(i)=sum/N;
end
        

end

