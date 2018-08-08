function [ Wpl ] = getWpl( Mpluv ,Yu)
%GETWPL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    N=size(Mpluv,1);
    sum1=0;
    sum2=0;
    for i=1:N
%         ȡ�����Ǿ���
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

