function [ Wpl ] = getWplV2( MpluvPath,Yu )
%GETWPLV2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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
%             k=k+((i-1)/20)*MpluvPath(2,i);%��Ч��(i-1)����Ϊ��getMpluvPath�У������������ʱ����1��
%         n=n+((i-1)/20)*MpluvPath(1,i);%����;
    end
    if(n~=0)
        Wpl=k/n;
    else
        Wpl=0;
    end
end

