function [ outMpluv ] = getMpluv( features )
%GETMPU �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
   
    N = size(features,1)
    outMpluv = zeros(N,N);
    for i = 1:N
        for j=1:N
            if (features(i,1)==features(j,1))
                outMpluv(i,j)=features(j,1);
            end
        end
    end
end

