function [param]=CrossValidation(X,max_itr,alpha ,initial_del,p)
D=size(X,2);
cost=zeros(1,10);
param=zeros(D,1);
parameters=zeros(D,10);
for i=1:10
    [train,test]=KCV(X,i);
    
    x=train(:,1:D-1);
    y=train(:,D);
    
    xtest=test(:,1:D-1);
    ytest=test(:,D);
    [x,y]=normalize(x,y);
    %[xtest,ytest]=normalize(xtest,ytest);

    xtest = [ones(length(xtest), 1) xtest];
    x = [ones(length(x), 1) x];

    parameter=zeros(D,1);
    
    
    %disp('x: ');
    %disp(size(x));
    %disp('y: ');
    %disp(size(y));
    [parameters(:,i)] = StochasticGD(x, y, parameter, alpha,initial_del,p);
    %disp('parameters:--');
    %disp(parameters(:,i));    
    cost(1,i) = ((xtest * parameters(:,i) - ytest)' * (xtest * parameters(:,i) - ytest)) / (2* length(ytest));
    %disp('cost: ');
    %disp(cost(1,i));
end

min=1000000;
for j=1:10
    if(min>cost(1,j))
        min=cost(1,j);
        param=parameters(:,j);
    end
end

%disp('param');
%disp(param);
end
