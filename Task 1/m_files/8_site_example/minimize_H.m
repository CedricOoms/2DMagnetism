function S3N = minimize_H(N,S,Sinit,M,HB)
tolerancija = 1e-10;
S3N = Sinit;
diff_vec = ones(3*N,1);
lambda = zeros(N,1);
while norm(diff_vec,2) > tolerancija
S3Nnew = -0.5*M*S3N-0.5*HB;
for i = 1:1:N
lambda(i,1) = norm(S3Nnew(3*i-2:3*i,1),2)/S;
end
for l = 1:1:N
S3Nnew(3*l-2:3*l,1) = S3Nnew(3*l-2:3*l,1)/lambda(l);
end
diff_vec = S3Nnew-S3N;
S3N = S3Nnew;
end