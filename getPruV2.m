    function [ res ] = getPruV2( flos,Wpl )
%GETPRUV2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    N=size(flos,1);
    res=zeros(N,1);%���յĸ��ʽ�����ϡ�
    for i=1:N
       nuo=0;
       nuore=0;
        for k=1:N %��I+1��ʼѰַҲ����u��v ���ɡ���Ҫ�� 1��ʼ
            sunuv=1;%��¼ÿ��uv������ֵ
            deget=0;
             for j=1:8  %ѭ��8������ֵ
%                 flok=flos(i,j);%i��Ӧ��ֵ��
%                     Ҳ����Ѱַ��ֱ���ж�������������ͺá�
%                 nuo=feacture(2,flok);%��ֵ����ȡ��Ԫ�صĸ���
                uflok=flos(i,j);
                vflok=flos(k,j);
                if(uflok==vflok)
                    deget=1;%����־λ��1.��������Լ�������
                     sunuv=sunuv*(1-((flos(i,j)-1)/20)*Wpl(j));%����͵õ���һ�������������pluv��((flos(i,j)-1)/20)�൱�ڰ�mpluv��������һ��
                end
                %ѭ��8�Σ�Ҳ�������һ������pluv ���ǻ�û����1-ȥ���ֵ
                
             end
             if(deget==1)   %�����ʾ���ѭ����V����Ч�ġ���Ҫ���м�����
               
                 sunuv=1-sunuv;%����Ҳ���������һ��Pruv����������u�йص�����v��ƽ��ֵ����ô����Ҫ����һ�μ��㡣�������Ǹ�0 �Ļ���
                 nuore=nuore+sunuv;%����������ۼӣ����ڼ������յ�ƽ��ֵ
                 nuo=nuo+1;%�ۼӼ�������
             end    
        end
        res(i,1)=nuore/nuo;%������ʡ�����ȡƽ��ֵ������ͬʱ������һ��������nuore�Լ�nuo���㡣 
    end
    
%                 for k=1:nuo
%                     if(feacture(k+2,flok)~=i) %д��������������ҵ���plu��ͬ������ֵ��Ȼ��Ӧ����ô���ء�ȡ������������

end

