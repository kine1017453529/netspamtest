function [ out_yu ] = getYu( RBFeatures, UBFeatures, RLFeatures,ULFeatures )
%GETYU 此处显示有关此函数的摘要
%   此处显示详细说明
    N = size(RBFeatures,1);
    out_yu = ones(N,1);
    for i=1:N
        for j=1:2
            out_yu(i,1)=RBFeatures(i,j)+UBFeatures(i,j)+RLFeatures(i,j)+ULFeatures(i,j);
        end
        out_yu(i,1)= out_yu(i,1)/8;
    end
    
            


end

