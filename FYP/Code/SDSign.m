function SDS=SDSign(imgName,cArr)
%% SIFT Descriptor Signature Algorithm
%%fprintf('Find SIFT descriptors in Test Image');
%% SIFT descriptor matrix
dArr=sift(imgName);
%%fprintf('Descriptors found :');
%% Codebook matrix
%%disp(size(dArr,2));
c=cArr;
d=transpose(dArr);
%%fprintf('Starting Feature Extraction....\n');
%%fprintf('Finding SIFT Descriptor Signature\n');
%% SD Signature matrix (Result)
SDS=zeros([1 size(c,1)]);
%% Index matrix use to store index of top 't' sorted values
Idx=[];
for i=1:size(d,1)
    EDV=[];
    if(i==1)
        %%fprintf('Inside i\n');
    end
    for j=1:size(c,1)        
        sum=0;
        sum=double(sum);
        if j==1
            %%fprintf('Inside j\n');
        end
        for k=1:size(c,2)
            %%fprintf('%d %d',d(i,k),c(j,k));
            if d(i,k)>c(j,k)                
                sum=sum+(double(d(i,k)-c(j,k)).^2);            
            else 
                sum=sum+(double(c(j,k)-d(i,k)).^2);            
            end
            if j==1                
                %%fprintf('%d\n',sum);
            end
        end
        EDV=[EDV,sqrt(double(sum))];    
    end     
    [SEDV Idx]=bubblesort(EDV);
    %% Adding constant(taken as 1) to respective SDS(Idx(j))
    for j=1:size(Idx,2)/3
        SDS(Idx(j))=SDS(Idx(j))+1;
    end
end
sum=double(0);
%%fprintf('updating SDS Vector');
for j=1:size(SDS,2)
        sum=sum+SDS(j);
end
   
%% SDS Update
for i=1:size(SDS,2)
    SDS(i)=SDS(i)/sum;    
end
end