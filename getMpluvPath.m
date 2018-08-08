function [ flo,U_V_Path ] = getMpluvPath( features,Yu )
%GETMPLUVPATH �˴���ʾ�йش˺�����ժҪ
% �������������ǻᳬ��ֱ�Ӱ�N�ֳ�20�����OK�ˡ������ʱ�򡣸�������ֵ���ҵ����������������u��OK
%   �˴���ʾ��ϸ˵��
N = size(features,1);
flo=zeros(N,1);
U_V_Path=zeros(N+2,20);
    for i = 1:N
      k=floor(features(i,1)*20)+1;%ȡ0~0.95 1������0.95*20
      if(k==21)
          k=20;
      end
      flo(i,1)=k;
      U_V_Path(1,k)=U_V_Path(1,k)+1;%�����Ԫ�ؼ�����
      if(Yu(i,1)~=0)
        U_V_Path(2,k)=U_V_Path(2,k)+1;%����з���Ԫ�ؼ�����
        U_V_Path(U_V_Path(2,k)+2,k)=i;%��ID
      end
    end

end

