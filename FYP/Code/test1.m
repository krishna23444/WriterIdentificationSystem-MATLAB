clc;
clearvars;
load simplecluster_dataset;
[x,t] = simplecluster_dataset; 
net = selforgmap([8 8]); 
net = train(net,x,t); 
view(net) 
y = net(x); 
classes = vec2ind(y);