function [ Wpl ] = getWplV2( MpluvPath,Yu )
%GETWPLV2 此处显示有关此函数的摘要
%   此处显示详细说明
%     N=size(MpluvPath,1)-2;
%     Wpl=zeros(N,1);
%     vae=zeros(20,1);
    k=0;
    n=0;
    for i=1:20
        nuo=MpluvPath(2,i);
        if(nuo~=0)
            for j=1:nuo
                for p=1:nuo
                    k=k+((i-1)/20)*Yu(MpluvPath(j+2,i),1)*Yu(MpluvPath(p+2,i),1);
                    n=n+((i-1)/20);
                end
            end
        end
%             k=k+((i-1)/20)*MpluvPath(2,i);%有效数(i-1)是因为在getMpluvPath中，区间分配问题时加了1；
%         n=n+((i-1)/20)*MpluvPath(1,i);%总数;
    end
    if(n~=0)
        Wpl=k/n;
    else
        Wpl=0;
    end
end

