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
