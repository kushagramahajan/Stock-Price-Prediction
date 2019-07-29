function [MSE ] = SVR( dataset,percent,alpha, delta,p,GD )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
D=size(dataset,2);
N=size(dataset,1);
f=ceil(N*percent);
 
train=dataset(1:f,:);
 test=dataset(f:N,:);
 
trainX=train(:,1:D-1);
trainY=train(:,D);

testX=test(:,1:D-1);
testY=test(:,D);

 trainX = [ones(length(trainX), 1) trainX];
 testX = [ones(length(testX), 1) testX];

Mdl = fitrsvm(trainX,trainY,'Standardize',true,'KernelFunction','linear');
MSE = loss(Mdl, testX, testY);
prediction=predict(Mdl,testX);

end

