%%%%%%%%% This file is just to experirment with multiplying
N = 100000000;
v = randn(N, 1);

result1 = v'*v

mult = zeros(N, 1);
for i = 1:N
    mult(i) = v(i)^2;
end
result2 = sum(mult)
