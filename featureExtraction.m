%Author: kine

% for speed up run the individual feature extraction code parallely

%output
%adjlist: adjacency list of the review network
%label: label of the reviews (if exist)

% 返回四种类型 feature RBFeatures, UBFeatures, RLFeatures,ULFeatures
function [RBFeatures, UBFeatures, RLFeatures,ULFeatures, adjlist, label] = featureExtraction(file1, file2)
disp('Loading data...')    
fid = fopen(file1);
    C = textscan(fid, '%s %s %s %s %s %s');
    review_id = C{1};
    user_id = C{2};
    prod_id = C{3};
    rating = str2double(C{4});
    label = str2double(C{5});
    date = cellstr(datestr(datevec(C{6}),'dd-mmm-yyyy'));
    clear C;
    fclose(fid);
    
    dateFormat = 'dd-mmm-yyyy';
    
    % adjacency list of the review network
    [~,userID] = ismember(user_id,unique(user_id));
    [~,prodID] = ismember(prod_id,unique(prod_id));
    adjlist = [userID,prodID,rating];
    
%     fid2 = fopen(file2);
%     D = textscan(fid2, '%s %s');
%     review_id = D{1};
%     clear D;
%     fclose(fid2);
%     N=size(adjlist,1);
%     review_id={0;1;};
%     
%     for k=2:N-1
%         review_id{k+1}=k;
%     end
%     
    
    RBFeatures=[];
    UBFeatures=[];
    RLFeatures=[];
    ULFeatures=[];
    disp('Begin feature extraction...')
    
    
    
     disp('RB feature.')
    disp('Extracting DEV feature.')
     % DEV feature for reviews（带阀值的评分偏差率）range(0,1)
    DEV_reviews = DEV(prod_id, rating);%真的是取0或1 吗这里只有0和1.文中的范围是0~1
    save('devV3.mat','DEV_reviews');
    DEV_reviews2=toS(DEV_reviews);
    RBFeatures = [RBFeatures,double(DEV_reviews2)];
    
    % ETF feature for reviews（早期时间帧）range(0,1)
    disp('Extracting ETF feature.')
    ETF_reviews = ETF(user_id, prod_id, date , dateFormat);
    RBFeatures = [RBFeatures,double(ETF_reviews)];
    
    
    
    
    
    
    
    
    disp('UL feature.') 
     
     disp('Extracting ACS feature.')
     disp('Extracting MCS feature.')
     % ACS and MCS features for users（平均内容相似度，最大内容相似度）
         % extract bigrams from reviews
    % run bigram.py
    % suggestion: run the python codes separately
    
%     !C:\Python27\python.exe 	biGram.py file2 output_biGram.txt
    
    % calculate TFIDF of reviews for bigrams
    [TFIDF,binaryBG,uniqueRID] = TFIDF_biGram(review_id,'output_biGram.txt');
    
    save('TFIDF','TFIDF','-v7.3');  
       % ACS and MCS features for products
%     [ACS_prod, MCS_prod] = ACS_MCS_prod(prod_id,TFIDF);
% ACS_prod;
%    MCS_prod ;
    
    [ACS_user, MCS_user] = ACS_MCS_user(user_id,TFIDF);
    save('ACS_user_v1.mat','ACS_user');
    save('MCS_user_v1.mat','MCS_user');
    ACS_user=toS(ACS_user);
    MCS_user=toS(MCS_user);
    ACS_user_Rev=UtoR(user_id,ACS_user);
    MCS_user_Rev=UtoR(user_id,MCS_user);
    ULFeatures = [ULFeatures,double(ACS_user_Rev)];
    ULFeatures = [ULFeatures,double(MCS_user_Rev)];
    
    
    

    
    
    
    
    
   
    
     disp('UB feature.')
     % NR feature for both user and product（负面评价比率（1-2星））range(0,1)
    disp('Extracting NR feature.')
    [NR_user] = NR(user_id,prod_id,rating);
    %add
    NR_userS=toS(NR_user);
    NR_user_Rev=UtoR(user_id,NR_userS);
    UBFeatures = [UBFeatures,double(NR_user_Rev)];


    disp('Extracting BST feature.')
    % BST feature for user （突发性）range(0,1)
    BST_user = BST(user_id, date, dateFormat);
    
    BST_userS=toS(BST_user);
    BST_userForRev=UtoR(user_id,BST_userS);
    UBFeatures = [UBFeatures,double(BST_userForRev)];
    
     disp('RL feature.')
     
     % RES feature for reviews（感叹号比例）
%      excSentenceCount.py file2 output_RES.csv
    disp('Extracting RES feature.')
    filename = 'output_RES.csv';
    fid = fopen(filename);
    C = textscan(fid, '%s %f', 'Delimiter', ',');
    RES_reviews = C{2};
    clear C;
    fclose(fid);
%     ADD
    RES_reviews2=toS(RES_reviews);
    RLFeatures = [RLFeatures,double(RES_reviews2)];
    
      % PP1 feature for reviews（第一人称比例）
%      ratioPPwordCount.py file2 output_PP1.csv
    disp('Extracting PP1 feature.')
    filename = 'output_PP1.csv';
    fid = fopen(filename);
    C = textscan(fid, '%s %f %f', 'Delimiter', ',');
    PP1_reviews = C{2};
    clear C;
    fclose(fid);
%     ADD
    PP1_reviews2=toS(PP1_reviews);
    RLFeatures = [RLFeatures,double(PP1_reviews2)];
    
    
    
     
%     % ACS and MCS features for products
%     [ACS_prod, MCS_prod] = ACS_MCS_prod(prod_id,TFIDF);
%     ULFeatures = [ULFeatures,double(ACS_prod)];
%     ULFeatures = [ULFeatures,double(MCS_prod)];
 
    disp('Feature Extraction Finished!')
end