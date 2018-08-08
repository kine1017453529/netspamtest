function [ pruv ] = getPruv( mpluv ,Wpl)
%GETPRUV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N=size(mpluv,1);
pruv = ones(N,N);
    for i=1:N
       for j=1:N
           data1=1;
           for k=1:8
               data1=data1*(1-mpluv(i,(j*(k-1)+1))*Wpl(k));
           end
           re=1-data1;
           pruv(i,j)=re;
       end
    end
       
end

