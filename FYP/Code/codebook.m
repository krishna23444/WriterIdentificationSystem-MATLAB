%% close all windows and clear all values
clearvars;
close all;
%%fprintf('Creating Codebook\n');
%%fprintf('Getting SIFT Descriptors from Training Images....\n');
%% Getting descriptors for all training samples
%% Tranining samples include 3 samples for each 4 handwriting (in our scenario)
cArr=[sift('Training/t (1).png'),sift('Training/t (2).png'),sift('Training/t (3).png'),sift('Training/t (4).png'),sift('Training/t (5).png'),sift('Training/t (6).png'),sift('Training/t (7).png'),sift('Training/t (8).png'),sift('Training/t (9).png'),sift('Training/t (10).png'),sift('Training/t (11).png'),sift('Training/t (12).png'),sift('Training/t (13).png'),sift('Training/t (14).png'),sift('Training/t (15).png'),sift('Training/t (16).png'),sift('Training/t (17).png'),sift('Training/t (18).png'),sift('Training/t (19).png'),sift('Training/t (20).png')];
fprintf('Total Descriptors found:');
disp(size(cArr,2));
%%fprintf('SIFT Descriptor successfully retrieved....\n');
%% Setting up Neural Network
inputs =double(cArr);   
dimension1 = 10;
dimension2 = 30;
%%fprintf('Setting up SOM Map....\n');
net = selforgmap([dimension1 dimension2]);
%%fprintf('Training Data....\n');
%% Training nodes in Neural network with descriptors
[net,tr] = train(net,inputs);
%%fprintf('Getting Clustering data....\n')
%% After training getting all the Node Weights
outputs = net.IW{1};
cArr=outputs;
fprintf('Codebook created.');