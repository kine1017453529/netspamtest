    function [ res ] = getPruV2( flos,Wpl )
%GETPRUV2 此处显示有关此函数的摘要
%   此处显示详细说明
    N=size(flos,1);
    res=zeros(N,1);%最终的概率结果集合。
    for i=1:N
       nuo=0;
       nuore=0;
        for k=1:N %从I+1开始寻址也就是u，v 不可。需要从 1开始
            sunuv=1;%记录每个uv计算后的值
            deget=0;
             for j=1:8  %循环8个特征值
%                 flok=flos(i,j);%i对应的值域
%                     也许不用寻址，直接判断两个数的区间就好。
%                 nuo=feacture(2,flok);%在值域中取得元素的个数
                uflok=flos(i,j);
                vflok=flos(k,j);
                if(uflok==vflok)
                    deget=1;%将标志位置1.方便计数以及计算结果
                     sunuv=sunuv*(1-((flos(i,j)-1)/20)*Wpl(j));%这里就得到了一个特征算出来的pluv；((flos(i,j)-1)/20)相当于把mpluv重新算了一次
                end
                %循环8次，也就算出了一个数的pluv 但是还没有用1-去这个值
                
             end
             if(deget==1)   %这里表示这次循环的V是有效的。需要进行计数。
               
                 sunuv=1-sunuv;%这里也就算出来了一个Pruv。最后是求和u有关的所有v的平均值。那么是需要作出一次计算。如果这个是个0 的话。
                 nuore=nuore+sunuv;%将结果进行累加，用于计算最终的平均值
                 nuo=nuo+1;%累加计数器。
             end    
        end
        res(i,1)=nuore/nuo;%计算概率。进行取平均值操作。同时进行下一波操作。nuore以及nuo清零。 
    end
    
%                 for k=1:nuo
%                     if(feacture(k+2,flok)~=i) %写到这里。这里你能找到和plu相同的所有值。然后应该怎么做呢。取出来还是怎样

end

