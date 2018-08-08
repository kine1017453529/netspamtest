function [ Pru ] = getPru( Pruv )
%GETPRU 此处显示有关此函数的摘要
%   此处显示详细说明
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

