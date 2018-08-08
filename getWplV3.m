function [ Wpl ] = getWplV3( flos,Yu )
%GETWPLV3 此处显示有关此函数的摘要
%   此处显示详细说明
    N=size(Yu,1);
    Wpl=zeros(8,1);
    for i=1:8
        upone=0;
        downone=0;
        for j=1:N
            for k=1:N
                if(flos(j,i)==flos(k,i))%Mplu!=0;
                    upone=upone+floor((flos(j,i)-1)*20)/20*Yu(i,1)*Yu(j,1);
                    downone=downone+floor((flos(j,i)-1)*20)/20;
                end
              
            end
        end
        if(downone~=0)
            Wpl(i,1)=upone/downone;
        else
            Wpl(i,1)=0;
        end
    end
          

end

