function [ flo,U_V_Path ] = getMpluvPath( features,Yu )
%GETMPLUVPATH 此处显示有关此函数的摘要
% 不能这样。还是会超，直接把N分成20个类就OK了。计算的时候。根据他的值，找到他的类里面的所有u就OK
%   此处显示详细说明
N = size(features,1);
flo=zeros(N,1);
U_V_Path=zeros(N+2,20);
    for i = 1:N
      k=floor(features(i,1)*20)+1;%取0~0.95 1是属于0.95*20
      if(k==21)
          k=20;
      end
      flo(i,1)=k;
      U_V_Path(1,k)=U_V_Path(1,k)+1;%类别中元素计数器
      if(Yu(i,1)~=0)
        U_V_Path(2,k)=U_V_Path(2,k)+1;%类别中非零元素计数器
        U_V_Path(U_V_Path(2,k)+2,k)=i;%存ID
      end
    end

end

