%clear all;
clear M, i, j;


B = [Bx By Bz];

M = zeros(3,3);

for i = 1:3
   for j = 1:3
       M(i,j) = mean(B(1:end,i).*B(1:end,j)) - mean(B(1:end,i)) * mean(B(1:end,j));
   end
end
M

[V,D] = eig(M)
