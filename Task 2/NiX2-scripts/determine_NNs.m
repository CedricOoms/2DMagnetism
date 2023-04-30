function [FirstNN,SecondNN,ThirdNN] = determine_NNs(P)

n = linspace(1,P*P,P*P)';
% FirstNN = zeecondNN = zeros(N*N,6)ros(N*N,6); S; ThirdNN = zeros(N*N,6);
%%%%% ### 1st NN begin ### %%%%%
FirstNN = [n+1 n-P+1 n-P n-1 n+P-1 n+P];
% a = [FirstNN(1:N,1),FirstNN(1:N,2)+N*N,FirstNN(1:N,3)+N*N,FirstNN(1:N,4),FirstNN(1:N,5),FirstNN(1:N,6)];
% b = [FirstNN(N+1:end,1),FirstNN(N+1:end,2),FirstNN(N+1:end,3),FirstNN(N+1:end,4),FirstNN(N+1:end,5),FirstNN(N+1:end,6)];
FirstNN = [[FirstNN(1:P,1),FirstNN(1:P,2)+P*P,FirstNN(1:P,3)+P*P,FirstNN(1:P,4),FirstNN(1:P,5),FirstNN(1:P,6)]; ... 
           [FirstNN(P+1:end,1),FirstNN(P+1:end,2),FirstNN(P+1:end,3),FirstNN(P+1:end,4),FirstNN(P+1:end,5),FirstNN(P+1:end,6)]];
FirstNN = [[FirstNN(1:P^2-P,1),FirstNN(1:P^2-P,2),FirstNN(1:P^2-P,3),FirstNN(1:P^2-P,4),FirstNN(1:P^2-P,5),FirstNN(1:P^2-P,6)]; ... 
           [FirstNN(P^2-P+1:end,1),FirstNN(P^2-P+1:end,2),FirstNN(P^2-P+1:end,3),FirstNN(P^2-P+1:end,4),FirstNN(P^2-P+1:end,5)-P*P,FirstNN(P^2-P+1:end,6)-P*P]];
for n = 1:1:P*P
if mod(n,P) == 1
    FirstNN(n,4:5) = FirstNN(n,4:5) + P;
elseif mod(n,P) == 0
    FirstNN(n,1:2) = FirstNN(n,1:2) - P;
end
end
%%%%% ### 1st NN  end   ### %%%%%
%%%%% ### 2nd NN begin  ### %%%%%
n = linspace(1,P*P,P*P)';
SecondNN = [n+2.*P-1 n+P+1 n-P+2 n-2.*P+1 n-P-1 n+P-2];
SecondNN = [[SecondNN(1:P,1),SecondNN(1:P,2),SecondNN(1:P,3)+P*P,SecondNN(1:P,4)+P*P,SecondNN(1:P,5)+P*P,SecondNN(1:P,6)]; ...
            [SecondNN(P+1:2*P,1),SecondNN(P+1:2*P,2),SecondNN(P+1:2*P,3),SecondNN(P+1:2*P,4)+P*P,SecondNN(P+1:2*P,5),SecondNN(P+1:2*P,6)]; ... 
            [SecondNN(2*P+1:end,1),SecondNN(2*P+1:end,2),SecondNN(2*P+1:end,3),SecondNN(2*P+1:end,4),SecondNN(2*P+1:end,5),SecondNN(2*P+1:end,6)]];
SecondNN = [[SecondNN(1:P^2-2*P,1),SecondNN(1:P^2-2*P,2),SecondNN(1:P^2-2*P,3),SecondNN(1:P^2-2*P,4),SecondNN(1:P^2-2*P,5),SecondNN(1:P^2-2*P,6)]; ...
            [SecondNN(P^2-2*P+1:P^2-P,1)-P*P,SecondNN(P^2-2*P+1:P^2-P,2),SecondNN(P^2-2*P+1:P^2-P,3),SecondNN(P^2-2*P+1:P^2-P,4),SecondNN(P^2-2*P+1:P^2-P,5),SecondNN(P^2-2*P+1:P^2-P,6)]; ... 
            [SecondNN(P^2-P+1:P^2,1)-P*P,SecondNN(P^2-P+1:P^2,2)-P*P,SecondNN(P^2-P+1:P^2,3),SecondNN(P^2-P+1:P^2,4),SecondNN(P^2-P+1:P^2,5),SecondNN(P^2-P+1:P^2,6)-P*P]];
for n = 1:1:P*P
if mod(n,P) == 1
    SecondNN(n,1) = SecondNN(n,1) + P; SecondNN(n,5:6) = SecondNN(n,5:6) + P;
elseif mod(n,P) == 2
    SecondNN(n,6) = SecondNN(n,6) + P;
elseif mod(n,P) == P-1
    SecondNN(n,3) = SecondNN(n,3) - P;
elseif mod(n,P) == 0
    SecondNN(n,2:4) = SecondNN(n,2:4) - P;
end
end      
%%%%% ### 2nd NN  end   ### %%%%%
%%%%% ### 3rd NN begin  ### %%%%%
n = linspace(1,P*P,P*P)';
ThirdNN = [n+2 n-2*P+2 n-2*P n-2 n+2*P-2 n+2*P];
ThirdNN = [[ThirdNN(1:2*P,1),ThirdNN(1:2*P,2)+P*P,ThirdNN(1:2*P,3)+P*P,ThirdNN(1:2*P,4),ThirdNN(1:2*P,5),ThirdNN(1:2*P,6)]; ...
           [ThirdNN(2*P+1:end,1),ThirdNN(2*P+1:end,2),ThirdNN(2*P+1:end,3),ThirdNN(2*P+1:end,4),ThirdNN(2*P+1:end,5),ThirdNN(2*P+1:end,6)]];
ThirdNN = [[ThirdNN(1:P^2-2*P,1),ThirdNN(1:P^2-2*P,2),ThirdNN(1:P^2-2*P,3),ThirdNN(1:P^2-2*P,4),ThirdNN(1:P^2-2*P,5),ThirdNN(1:P^2-2*P,6)]; ...
           [ThirdNN(P^2-2*P+1:end,1),ThirdNN(P^2-2*P+1:end,2),ThirdNN(P^2-2*P+1:end,3),ThirdNN(P^2-2*P+1:end,4),ThirdNN(P^2-2*P+1:end,5)-P*P,ThirdNN(P^2-2*P+1:end,6)-P*P]];   
for n = 1:1:P*P
if (mod(n,P) == 1) || (mod(n,P) == 2) 
    ThirdNN(n,4:5) = ThirdNN(n,4:5) + P;
elseif (mod(n,P) == P-1) || (mod(n,P) == 0)
    ThirdNN(n,1:2) = ThirdNN(n,1:2) - P;
end
end
%%%%% ### 3rd NN  end   ### %%%%%
end