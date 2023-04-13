function M = fill_big_matrix_M(N,A,J_0,J_m120,J_p120)
M = zeros(3*N,3*N);
for i = 3:3:3*N
  M(i-2:i,i-2:i) = 2*(A);
end
for i = 6:6:3*N
  M(i-2:i,i-5:i-3) = J_0;
  M(i-5:i-3,i-2:i) = J_0;
end
for i = 3:3:3*N/2
  M(3*N/2-i+1:3*N/2-i+3,i-2:i) = J_m120;
  M(3*N/2-i+1+3*N/2:3*N/2-i+3+3*N/2,i-2+3*N/2:i+3*N/2) = J_m120;
end
for i = 3:6:3*N/2
M(i+13:i+15,i-2:i) = J_p120;
M(i-2:i,i+13:i+15) = J_p120;
M(i+10:i+12,i+1:i+3) = J_p120;
M(i+1:i+3,i+10:i+12) = J_p120;
end