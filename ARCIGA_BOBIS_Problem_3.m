points=input('input the set of points in nx2 matrix form [x1 y1;x2 y2; x3 x3]:');

A=[];
limit=size(points);
limit=limit(1);
%using least norm
for k=1:1:limit
    
    %fill with 1's for computation formula
    A(1:limit,1)=1;
    
    
    %store data values to A
    for n=2:1:k+1
        A(:,n)=points(:,1)'.^(n-1);
        
    end
    
    %constants to rhs
    b=points(:,2);
    
    %Compute coefficients x;  
    coef=(inv(transpose(A)*A))*(transpose(A)*b); 
    coef=flip(coef');%inverted coefficients
    
    
    fxi=polyval(coef,points(:,1)); % compute for values using approximated polynomial
    
    error=b-fxi; % computation or error
    error_sum(k)=sum(error.^2);
end

%use the best error sum, find the index
ust=min(error_sum);
n=find(error_sum==ust);

A(1:limit,1)=1;

for n=2:1:(k+1)
    A(:,n)=points(:,1)'.^(n-1);
end
b=points(:,2);
%%produce the coefficients
coef=(inv(transpose(A)*A))*(transpose(A)*b);
polynomial=flip(coef')