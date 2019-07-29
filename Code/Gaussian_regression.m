function [MSE] = Gaussian_regression( dataset,percent,sigma)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%sigma0 = 0.0002;
%sigma0=std(trainY);

 D=size(dataset,2);
 N=size(dataset,1);
 f=ceil(N*percent);
 
 train=dataset(1:f,:);
 test=dataset(f:N,:);

 
%% to be commented for cross validation 
trainX=train(:,1:D-1);

trainY=train(:,D);

testX=test(:,1:D-1);
testY=test(:,D);

 trainX = [ones(length(trainX), 1) trainX];
 testX = [ones(length(testX), 1) testX];

gprMdl = fitrgp(trainX,trainY,'Sigma',sigma);

%%%loss on the training data
L = resubLoss(gprMdl);

%%%loss on test
L = loss(gprMdl,testX,testY);

ypred = predict(gprMdl,testX);
MSE=calculateMSE(testY,ypred);

prediction = ypred;

end

