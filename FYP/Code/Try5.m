clearvars;
clear;
close all;
shg;
clc;
I=imread('W-A-1 (1).png');
image(I);
I = single(rgb2gray(I)) ;
[f,d] = vl_sift(I);
perm=zeros(size(f,2));
for k=1:size(f,2)
    perm(k)=k;
end
[a b]=size(f);
 if(b>40)
        b=b-20;
end   
sel = perm(1:b);
disp(b);
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;