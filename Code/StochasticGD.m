function [ parameters ] = StochasticGD( x, y, parameters, alpha,delta,p)
    %disp('parameters');
    %disp(size(parameters));
    D=size(x,2);
    m = length(y);
    temp=zeros(D,1);
   % fprintf('Size of x = %d %d \n',size(x));
   % fprintf('Size of parameters = %d %d \n',size(parameters));

    repetition=2000;
    for i = 1:repetition
         
         h = (x * parameters - y)';
          for j = 1:D
              temp(j)=(1/m) * h * x(:, j);
              %%% changed by kush
              parameters(j) = parameters(j) - (alpha * temp(j))-(1/m)*(p*delta*(parameters(j)^(p-1)));
          end
                 
    end
   
       
end

