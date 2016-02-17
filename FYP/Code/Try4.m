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
org=imread('S-A-1 (1).png');
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
figure(1);
imshow(bin);
title('Binary Image');
cc=bwconncomp(bin);
stats=regionprops(cc,'Image');
fprintf('Connected Components Step two');
disp(cc);
he=0;
for j=1:length(stats)
    [hei,wid]=size(stats(j).Image);  
    he=he+hei;
end
avg=he/length(stats);
fprintf('Average height :');
disp(avg);
sigma=2.5*avg;
fsp=fspecial('gaussian',[round(avg-2) round(avg-2)],sigma);
fil=conv2(single(bin) , fsp , 'same');
figure(2);
imshow(fil);
title('Filtered Image');
%%Binary filtered image
threshold=graythresh(fil);
binfil=im2bw(fil,threshold);
figure(3);
imshow(binfil);
title('Filtered binary Image');
%%Assign Connected Components of Ib using Ifb
figure(4);
imshow(org);
[binfil Ne] = bwlabel(binfil);
propied1=regionprops(binfil,'BoundingBox');
hold on
for n=1:size(propied1,1)
    rectangle('Position',propied1(n).BoundingBox,'EdgeColor','r','LineWidth',2);
end
figure(5)
x=(Ne/3)+1;
y=3;
rArr=[];
for n=1:Ne
    [r,c] = find(binfil==n);
    n1=bin(min(r):max(r),min(c):max(c));
    subplot(x,y,n),imshow(n1);   
    n1 = single(n1) ;    
    [f,d] = vl_sift(n1);
    h1 = vl_plotframe(f) ;
    rArr=[rArr,d];
    h2 = vl_plotframe(f) ;
    set(h1,'color','k','linewidth',3) ;
    set(h2,'color','y','linewidth',2) ;
    title(n);
    pause(0.5)
end

inputs =double(rArr);
figure(6)
dimension1 = 10;
dimension2 = 5;
net = selforgmap([dimension1 dimension2]);
net=configure(net,inputs);
plotsompos(net,inputs);
figure(7)
[net,tr] = train(net,inputs);
plotsompos(net,inputs);
figure, plotsomhits(net,inputs)
outputs = transpose(net.IW{1});
% Plots
% Uncomment these lines to enable various plots.
%%figure, plotsomtop(net)
%%figure, plotsomnc(net)
%%figure, plotsomnd(net)
%%figure, plotsomplanes(net)
%%figure, plotsomhits(net,inputs)
%%figure, plotsompos(net,inputs)

%{
[x,t] = size(resArr);
figure(6);
plot(resArr,'+') 
net = selforgmap([8 8]); 
net = train(net,resArr); 
view(net) 
y = net(x); 
%}
