%%Almost Successful
%%Word Segmentation
%%Clear screen
run('VLFEAT/toolbox/vl_setup');
clc;
shg;
close all;
clear all;
clearvars;
warning off;
%%Reading Image
org=imread('S-A-2 (1).png');
[height width]=size(org);
%%Convert color image to grayscale 
if size(org, 3) > 1
  org = rgb2gray(org);
end
%%Otsu Algorithm Coversion of original image into binary image Step 1
org=im2uint8(org);%% Convert from logical to uint8 size
threshold=graythresh(org);
bin=~im2bw(org,threshold);
%%Get all the connected components from the image and compute avg height
%%Step2
%%figure(1);
%%imshow(bin);
%%title('Binary Image');
cc=bwconncomp(bin);
stats=regionprops(cc,'Image');
%%fprintf('Connected Components Step two');
%%disp(cc);
he=0;
for j=1:length(stats)
    [hei,wid]=size(stats(j).Image);  
    he=he+hei;
end
avg=he/length(stats);
%%fprintf('Average height :');
%%disp(avg);
sigma=2.5*avg;
fsp=fspecial('gaussian',[round(avg-2) round(avg-2)],sigma);
fil=conv2(single(bin) , fsp , 'same');
%%figure(2);
%%imshow(fil);
%%title('Filtered Binary Image');
%%Binary filtered image
threshold=graythresh(fil);
binfil=im2bw(fil,threshold);
%%figure(3);
%%imshow(binfil);
%%Assign Connected Components of Ib using Ifb
figure(1);
imshow(org);
[binfil Ne] = bwlabel(binfil);
propied1=regionprops(binfil,'BoundingBox');
hold on
for n=1:size(propied1,1)
    rectangle('Position',propied1(n).BoundingBox,'EdgeColor','r','LineWidth',2);
end
figure(2)
x=(Ne/3)+1;
y=3;
rArr=[];
for n=1:Ne
    [r,c] = find(binfil==n);
    n1=org(min(r):max(r),min(c):max(c));
    subplot(x,y,n),imshow(n1);   
    n1 = single(n1) ;
    [f,d] = vl_sift(n1);    
    perm=zeros(size(f,2));
    for k=1:size(f,2)
        perm(k)=k;
    end
    [a b]=size(f);    
    if(b>40)
        b=b-17;
    end
%%disp(b);
    sel = perm(1:b);    
    h1 = vl_plotframe(f(:,sel)) ;
    h2 = vl_plotframe(f(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','y','linewidth',2) ;
    rArr=[rArr,d(:,sel)];
    title(n);
    pause(0.5)
end
resArr=rArr;
resArr=resArr';
inputs = resArr;
%%figure(2);hist(inputs);title('histogram - Input');
dimension1 = 1;
dimension2 = 128;
net = selforgmap([dimension1 dimension2]);
[net,tr] = train(net,inputs);
outputs1 = net(inputs);
%%figure(3);hist(outputs);title('histogram - Output');
figure, plotsompos(net,inputs)

%{
%%Compare

org=imread('S-A-3 (1).png');
[height width]=size(org);
%%Convert color image to grayscale 
if size(org, 3) > 1
  org = rgb2gray(org);
end
%%Otsu Algorithm Coversion of original image into binary image Step 1
org=im2uint8(org);%% Convert from logical to uint8 size
threshold=graythresh(org);
bin=~im2bw(org,threshold);
%%Get all the connected components from the image and compute avg height
%%Step2
%%figure(1);
%%imshow(bin);
%%title('Binary Image');
cc=bwconncomp(bin);
stats=regionprops(cc,'Image');
%%fprintf('Connected Components Step two');
%%disp(cc);
he=0;
for j=1:length(stats)
    [hei,wid]=size(stats(j).Image);  
    he=he+hei;
end
avg=he/length(stats);
%%fprintf('Average height :');
%%disp(avg);
sigma=2.5*avg;
fsp=fspecial('gaussian',[round(avg-2) round(avg-2)],sigma);
fil=conv2(single(bin) , fsp , 'same');
%%figure(2);
%%imshow(fil);
%%title('Filtered Binary Image');
%%Binary filtered image
threshold=graythresh(fil);
binfil=im2bw(fil,threshold);
%%figure(3);
%%imshow(binfil);
%%Assign Connected Components of Ib using Ifb
figure(3);
imshow(org);
[binfil Ne] = bwlabel(binfil);
propied1=regionprops(binfil,'BoundingBox');
hold on
for n=1:size(propied1,1)
    rectangle('Position',propied1(n).BoundingBox,'EdgeColor','r','LineWidth',2);
end
figure(4)
x=(Ne/3)+1;
y=3;
rArr=[];
for n=1:Ne    
    [r,c] = find(binfil==n);
    n1=bin(min(r):max(r),min(c):max(c));
    subplot(x,y,n),imshow(n1);   
    n1 = single(n1) ;
    %{
    if(b>30)
        b=20;
    elseif(b<20&&b>10)
        b=10
    elseif(b<10&&b>5)
        b=5
    end
    %}
    
    [f,d] = vl_sift(n1);
    perm=zeros(size(f,2));
    for k=1:size(f,2)
        perm(k)=k;
    end
    [a b]=size(f);    
    if(b>40)
        b=b-17;
    end
    %%disp(b);
    sel = perm(1:b);    
    h1 = vl_plotframe(f(:,sel)) ;
    rArr=[rArr,d(:,sel)];
    h2 = vl_plotframe(f(:,sel)) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','y','linewidth',2) ;
    title(n);
    pause(0.5)
end
[a b]=size(rArr);
if(b>300)
    b=300;
end
resArr=zeros([128,300]);
for i=1:size(rArr,1)
    for j=1:b    
        resArr(i,j)=rArr(i,j);
    end
end

outputs2=resArr;
%}