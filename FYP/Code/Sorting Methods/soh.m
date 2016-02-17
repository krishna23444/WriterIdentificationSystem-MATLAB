c=[1 2;3 4;5 6;7 8;9 10;];
d=[11 12;13 14;15 16;17 19;20 21];
SDS=zeros([1 size(c,1)]);
for i=1:size(d,1)
    EDV=[];
    for j=1:size(c,1)        
        sum=0;
        for k=1:size(c,2)
            fprintf('%d=%d+(%d-%d)^2\n',sum,sum,d(i,k),c(j,k));
            sum=sum+(d(i,k)-c(j,k)).^2;                        
        end        
        EDV=[EDV,sqrt(sum)];    
    end     
    [SEDV Idx]=bubblesort(EDV);
    for j=1:size(Idx,2)
        SDS(Idx(j))=SDS(Idx(j))+1;
    end   
end

sum=0;

for i=1:size(SDS,2)
   sum=sum+SDS(i);
end

for i=1:size(SDS,2)
    SDS(i)=SDS(i)/sum;    
end