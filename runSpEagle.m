%Author: KIne

%% calculating the features for users, reviews, products

% following are the two input file containing both meta data and review
% network information
% 
% %ע�����´��롣ͨ�������м����ݽ���
% 
% fileName1 = 'Yelp_Hotel_SpEagle_meta0_1V2.csv'; % contains review_id user_id, product_id, rating(1-5*), 
%                             % label(recommended +1 and non-recommended -1),
%                             % and date of reviews
% fileName2 = 'Yelp_Hotel_SpEagle_content0_1V2.csv'; % contains  review_id review_text
% 
% %my code
% [RBFeatures, UBFeatures, RLFeatures,ULFeatures, adjlist, label] = featureExtraction(fileName1, fileName2);
% save('features.mat','RBFeatures','UBFeatures','RLFeatures','ULFeatures','adjlist','label');
% N = max(adjlist(:,1)); % number of users
% M = max(adjlist(:,2)); % number of products
% E = size(adjlist,1); % number of reviews0
% % �����ʼ����
% Yu=getYu(RBFeatures, UBFeatures, RLFeatures,ULFeatures);
% save('Yu.mat','Yu')

load('Yu.mat');
load('features.mat');
% 
% % ����ÿ������ֵ��Ԫ·�� ����һ��N*N�ľ���ᳬ��
% % MpDEVuv=getMpluv(RBFeatures(:,1));
% % MpETFuv=getMpluv(RBFeatures(:,2));
% % MpNRuv=getMpluv(UBFeatures(:,1));
% % MpBSTuv=getMpluv(UBFeatures(:,2));
% % MpRESuv=getMpluv(RLFeatures(:,1));
% % MpPP1uv=getMpluv(RLFeatures(:,2));
% % MpACSuv=getMpluv(ULFeatures(:,1));
% % MpMCSuv=getMpluv(ULFeatures(:,2));
% % Ϊ�˽���������⣬׼����ÿ���������ݼ�¼���������ҽ�ÿ��featuresת������1~20
% % ͻȻ����Mpluvû�м���ı�Ҫ��ÿ���õ�ʱ����ȡ�ġ���ʵ������Ȼ��Դ�������޸�
% [floDev,MpDEVuv]=getMpluvPath(RBFeatures(:,1),Yu);
% [floETF,MpETFuv]=getMpluvPath(RBFeatures(:,2),Yu);
% [floNR,MpNRuv]=getMpluvPath(UBFeatures(:,1),Yu);
% [floBST,MpBSTuv]=getMpluvPath(UBFeatures(:,2),Yu);
% [floRES,MpRESuv]=getMpluvPath(RLFeatures(:,1),Yu);
% [floPP1,MpPP1uv]=getMpluvPath(RLFeatures(:,2),Yu);
% [floACS,MpACSuv]=getMpluvPath(ULFeatures(:,1),Yu);
% [floMCS,MpMCSuv]=getMpluvPath(ULFeatures(:,2),Yu);
% flos=[floDev,floETF,floNR,floBST,floRES,floPP1,floACS,floMCS];
% Mpluv=[MpDEVuv,MpETFuv,MpNRuv,MpBSTuv,MpRESuv,MpPP1uv,MpACSuv,MpMCSuv];%size 2+N *20* 8
% save('fols.mat','flos');
% save('Mpluv.mat','Mpluv');
% % save('Mpluv.mat','MpDEVuv','MpETFuv','MpNRuv','MpBSTuv','MpRESuv','MpPP1uv','MpACSuv','MpMCSuv');

% Mpluv=[];
% Mpluv=[MpDEVuv,MpETFuv,MpNRuv,MpBSTuv,MpRESuv,MpPP1uv,MpACSuv,MpMCSuv];
% save('Mpluv.mat','Mpluv');
% ��������ֵȨ��
% WpDEV=getWpl(MpDEVuv,Yu);
% WpETF=getWpl(MpETFuv,Yu);
% WpNR=getWpl(MpNRuv,Yu);
% WpBST=getWpl(MpBSTuv,Yu);
% WpRES=getWpl(MpRESuv,Yu);
% WpPP1=getWpl(MpPP1uv,Yu);
% WpACS=getWpl(MpACSuv,Yu);
% WpMCS=getWpl(MpMCSuv,Yu);
% Wpl=[WpDEV,WpETF,WpNR,WpBST,WpRES,WpPP1,WpACS,WpMCS];
% save('Wpl.mat','Wpl');

% Ȩ�ؼ����Ӧ�����޸�
% WpDEV=getWplV2(MpDEVuv,Yu);
% WpETF=getWplV2(MpETFuv,Yu);
% WpNR=getWplV2(MpNRuv,Yu);
% WpBST=getWplV2(MpBSTuv,Yu);
% WpRES=getWplV2(MpRESuv,Yu);
% WpPP1=getWplV2(MpPP1uv,Yu);
% WpACS=getWplV2(MpACSuv,Yu);
% WpMCS=getWplV2(MpMCSuv,Yu);
% Wpl=[WpDEV,WpETF,WpNR,WpBST,WpRES,WpPP1,WpACS,WpMCS];

load('fols.mat');

Wpl=getWplV3(flos,Yu);
save('Wpl.mat','Wpl');

PruV2=getPruV2(flos,Wpl);
save('PruV2.mat','PruV2');

% Pruv=getPruv(Mpluv,Wpl);
% save('Wpl.mat','Wpl');
% pru=getPru(Pruv);
% save('pru.mat','pru');























