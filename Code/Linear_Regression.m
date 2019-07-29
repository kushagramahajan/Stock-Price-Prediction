function [parameters,prediction,MSE] = Linear_Regression(dataset, percent,alpha, delta,p,GD)

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
    parameters = zeros(D,1);

    MSE=0;
   if GD==0
        [parameters] = StochasticGD(trainX, trainY, parameters, alpha,delta,p);
   
   elseif GD==1
        [parameters] = BatchGD(trainX, trainY, parameters, alpha,delta,p);
        
    end


    %%%% commented by kush to chck outcome from inbuilt function
   % Mdl = fitrlinear(trainX,trainY,'Learner','leastsquares', 'Regularization','lasso','Lambda',0.1);
    %[Mdl,fitinfo] = fitrlinear(trainX,trainY);
   % disp(Md1);
    %disp(fitinfo);
%prediction= predict(Mdl,testX);

%%added by kush
%[parameters]=CrossValidation(train,2000,alpha, delta,p);
prediction= predict(testX,parameters);
%disp('params:');
%disp(parameters);
MSE=calculateMSE(testY,prediction);
%disp('MSE:');
%disp(MSE);

end