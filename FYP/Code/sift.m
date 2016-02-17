function rArr=sift(imgName)
%% import VL_FEAT Package
run('VLFEAT/toolbox/vl_setup');
%% Reading Original image
org=imread(imgName);
[height width]=size(org);
%% Converting color image to Gray scale
if size(org, 3) > 1
  org = rgb2gray(org);
end
%% Converting from 'Logical' to 'Uint8' data type
org=im2uint8(org);
%% Performing Otsu Algorithm
threshold=graythresh(org);
bin=~im2bw(org,threshold);
%% Getting Connected components from binary image
cc=bwconncomp(bin);
stats=regionprops(cc,'Image');
he=0;
%% Finding average height
for j=1:length(stats)
    [hei,wid]=size(stats(j).Image);  
    he=he+hei;
end
avg=he/length(stats);
%% Performing Laplacian of Gaussian filter
sigma=2.5*avg;
fsp=fspecial('gaussian',[round(avg-2) round(avg-2)],sigma);
fil=conv2(single(bin) , fsp , 'same');
%% Filterd Image --> Filtered binary image Ifb
threshold=graythresh(fil);
binfil=im2bw(fil,threshold);
%% Labelling all the connected components in Ifb
[binfil Ne] = bwlabel(binfil);
%% Use each Word to get SIFT descriptors 
rArr=[];
for n=1:Ne
    [r,c] = find(binfil==n);
    n1=bin(min(r):max(r),min(c):max(c));
    n1 = single(n1) ;
    [f,d] = vl_sift(n1);
    perm=zeros(size(d,2));
    for k=1:size(d,2)
        perm(k)=k;
    end
    [a b]=size(d);    
    if(b>40)
        b=b-17;
    end
    sel = perm(1:b);    
    rArr=[rArr,d(:,sel)];
    pause(0.5)
end
end