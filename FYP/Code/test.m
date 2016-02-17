clearvars;
close all;
clc;
inputs=[1 3 12 11 18 17 1 3 12 11 18 17;...
0.2 0.1 0.3 0.1 0.3 0.2 1.8 1.8 1.9 1.9 1.7 1.8];
%%inputs = [7 10;6 2];
net=selforgmap([2,2]);
net=configure(net,inputs);
plotsompos(net,inputs);
net.trainParam.epochs = 1000;
net = train(net,inputs);
plotsompos(net,inputs)
output=net(inputs);