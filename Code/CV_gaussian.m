function [avg_MSE]=CV_gaussian(dataset,percent,sigma)

D=size(dataset,2);
N=size(dataset,1);
f=ceil(N*percent);
 

TRAIN=dataset(1:f,:);
TEST=dataset(f:N,:);


avg_MSE=0;
sum=0;
for i=1:5
   % [train,test]=KCV(TRAIN,i);
    
    %x=train(:,1:D-1);
    %y=train(:,D);
    
    %xtest=test(:,1:D-1);
    %ytest=test(:,D);
    %[x,y]=normalize(x,y);
    %[xtest,ytest]=normalize(xtest,ytest);
% 
%     xtest = [ones(length(xtest), 1) xtest];
%     x = [ones(length(x), 1) x];

        
    [MSE]=Gaussian_regression(x,y,xtest,ytest,sigma);
    
%     sum=sum+MSE;
    
   
end
% avg_MSE=sum/5;

end
