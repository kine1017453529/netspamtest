function [ Wpl ] = getWpl( Mpluv ,Yu)
%GETWPL 此处显示有关此函数的摘要
%   此处显示详细说明
    N=size(Mpluv,1);
    sum1=0;
    sum2=0;
    for i=1:N
%         取下三角矩阵
        for j=i+1:N
            sum1=sum1+Mpluv(i,j)*Yu(i)*Yu(j);
            sum2=sum2+Mpluv(i,j);
        end
    end
    if(sum2~=0)
        Wpl=sum1/sum2;
    else
        Wpl=0;
    end

end

