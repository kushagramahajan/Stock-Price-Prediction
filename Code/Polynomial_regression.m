function [ parameters,prediction,MSE ] = Polynomial_regression(dataset,percent,alpha, delta,p,GD)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
parameters=[];
prediction=[];
MSE=0;
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

 p = polyfit(trainx,trainy,3);
 f = polyval(p,testX);
 disp(p);
 disp(f);

end

