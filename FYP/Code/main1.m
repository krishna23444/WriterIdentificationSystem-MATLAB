i1Arr=SOH('S-A-1 (3).png');
i2Arr=SOH('S-A-2 (2).png');
i3Arr=SOH('S-A-3 (2).png');
i4Arr=SOH('S-A-3 (1).png');

diffArr=[];
for i=1:size(i1Arr,2)
    if i1Arr(1,i)>i2Arr(1,i)
        diffArr=[diffArr,(i1Arr(1,i)-i2Arr(1,i))];
    else 
        diffArr=[diffArr,(i2Arr(1,i)-i1Arr(1,i))];
    end
end

diffArr1=[];
for i=1:size(i3Arr,2)
    if i3Arr(1,i)>i4Arr(1,i)
        diffArr1=[diffArr1,(i3Arr(1,i)-i4Arr(1,i))];
    else 
        diffArr1=[diffArr1,(i4Arr(1,i)-i3Arr(1,i))];
    end
end

figure(1);plot(diffArr);hold all;plot(diffArr1);hold off;