function [ output_features ] = toS( features )
%TOS 此处显示有关此函数的摘要
%   此处显示详细说明
    output_features=floor(features*20)/20;
%     N = length(features);
%     output_features = ones(N,1);
%     for i = 1:N
%         output_features(i,1)=floor(features(i,1)*20)/20;
%     end

end

