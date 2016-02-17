inputs = resArr;
figure(2);hist(inputs);title('histogram - Input');
dimension1 = 128;
dimension2 = 1;
net = selforgmap([dimension1 dimension2]);
net= train(net,inputs);
outputs = net(inputs);
figure(3);hist(outputs);title('histogram - Output');
