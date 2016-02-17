%% Different Handwriting
D1a=0;
D2a=0;
D1b=0;
D2b=0;

fArr=SDSign('S-A-1 (1).png',cArr);
sArr=SDSign('S-A-4 (3).png',cArr);
eArr=[];

for i=1:size(fArr,2)
    if fArr(1,i)>sArr(1,i)
        eArr=[eArr,(fArr(1,i)-sArr(1,i))];
    else 
        eArr=[eArr,(sArr(1,i)-fArr(1,i))];
    end
end
data1=eArr;

for i=1:size(fArr,2)
    D1a=D1a+abs(fArr(i)-sArr(i));
end

%% Same Handwriting
fArr=SDSign('S-A-3 (1).png',cArr);
sArr=SDSign('S-A-3 (2).png',cArr);
eArr=[];
for i=1:size(fArr,2)
    if fArr(1,i)>sArr(1,i)
        eArr=[eArr,(fArr(1,i)-sArr(1,i))];
    else 
        eArr=[eArr,(sArr(1,i)-fArr(1,i))];
    end
end
data2=eArr;

for i=1:size(fArr,2)
    D1b=D1b+abs(fArr(i)-sArr(i));
end

%%Plotting SDS 
fprintf('Plotting difference of SDS-Different Writer and Same Writer');
figure(1);plot(data1);hold all;plot(data2);hold off;

i1Arr=SOH('S-A-1 (1).png');
i2Arr=SOH('S-A-4 (3).png');
i3Arr=SOH('S-A-3 (1).png');
i4Arr=SOH('S-A-3 (2).png');

%%Different Writer
diffArr=[];
for i=1:size(i1Arr,2)
    if i1Arr(1,i)>i2Arr(1,i)
        diffArr=[diffArr,(i1Arr(1,i)-i2Arr(1,i))];
    else 
        diffArr=[diffArr,(i2Arr(1,i)-i1Arr(1,i))];
    end
end

for i=1:size(i1Arr,2)
    D2a=D2a+((i1Arr(i)-i2Arr(i))*(i1Arr(i)-i2Arr(i))/(i1Arr(i)+i2Arr(i)));
end


%%Same Writer
diffArr1=[];
for i=1:size(i3Arr,2)
    if i3Arr(1,i)>i4Arr(1,i)
        diffArr1=[diffArr1,(i3Arr(1,i)-i4Arr(1,i))];
    else 
        diffArr1=[diffArr1,(i4Arr(1,i)-i3Arr(1,i))];
    end
end

for i=1:size(i3Arr,2)
    D2b=D2b+((i3Arr(i)-i4Arr(i))*(i3Arr(i)-i4Arr(i))/(i3Arr(i)+i4Arr(i)));
end

%%Plot difference between same and different writer
figure(2);plot(diffArr);hold all;plot(diffArr1);hold off; 

Da=(0.5*(D1a))+(0.5*(D1b));
Db=(0.5*(D1b))+(0.5*(D1b));
disp(Da);
disp(Db);
