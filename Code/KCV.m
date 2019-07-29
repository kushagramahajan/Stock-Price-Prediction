function [train,test]= KCV(X,i)

k=5;
N=size(X,1);
D=size(X,2);
p=floor(N/k);
if(i==1)
    test=X(1:p,:);
    train=X(p+1:end,:);
end
if(i==5)
    test=X(4*p+1:end,:);
    train=X(1:4*p,:);
end
if(i~=1 || i~=5)
    test=X((i-1)*p+1:i*p,:);
    temp1=X(1:(i-1)*p,:);
    temp2=X(i*p+1:end,:);
    train=[temp1;temp2];
end


end