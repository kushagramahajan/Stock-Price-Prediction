function [ parameters ] = BatchGD( x, y, parameters, alpha,delta,p)
    
    D=size(x,2);
    N=size(x,1);
   % N=1000;
    m = length(y);
   % fprintf('Size of x = %d %d \n',size(x));
   % fprintf('Size of parameters = %d %d \n',size(parameters));

    repetition=1000;
    for i = 1:repetition
         
          for j = 1:D
              temp=zeros(D,1);
              for k= 1:N
                h = (x(k,:) * parameters  - y(k,:))';
                temp(j)=temp(j)+ (1/m)*h * x(k, j);
              end
              %%%changed by kush
                parameters(j) = parameters(j) - (alpha * temp(j))-(1/m)*(p*delta*(parameters(j)^(p-1)));

          
              
          end
                 
    end
   
       
end
