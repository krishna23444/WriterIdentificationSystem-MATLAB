%% Different Handwriting
fprintf('In set I:\n');
fprintf('Processing Image 1(Different Writer):\n');
fArr=SDSign('S-A-1 (1).png',cArr);
fprintf('Processing Image 2:\n');
sArr=SDSign('S-A-4 (3).png',cArr);
eArr=[];
for i=1:size(fArr,2)
    if fArr(1,i)>sArr(1,i)
        eArr=[eArr,(fArr(1,i)-sArr(1,i))];
    else 
        eArr=[eArr,(sArr(1,i)-fArr(1,i))];
    end
end
fprintf('Plotting difference of SDS');
figure(1); bar(eArr);
data1=eArr;

%% Same Handwriting
fprintf('In set II(Different Writer):\n');
fprintf('Processing Image 1:\n');
fArr=SDSign('S-A-3 (1).png',cArr);
fprintf('Processing Image 2:\n');
sArr=SDSign('S-A-3 (2).png',cArr);
eArr=[];
for i=1:size(fArr,2)
    if fArr(1,i)>sArr(1,i)
        eArr=[eArr,(fArr(1,i)-sArr(1,i))];
    else 
        eArr=[eArr,(sArr(1,i)-fArr(1,i))];
    end
end
fprintf('Plotting difference of SDS');
figure(2); bar(eArr);

data2=eArr;

%% Plot Same vs Different Handwriting
 figure(3);plot(data1);hold all;plot(data2);hold off;