%%%%%% INITIATION OF VARS + INPUT FILE (BEGIN) %%%%%%
fid = fopen('input_J_A_CrI_3.dat', 'r');
data1 = fscanf(fid, '%f');
N = data1(1);     %% number of sites/magnetic moments 
S = 1.5;          %% magnitude of spins
theta = 60; phi = 0;
A = reshape(data1(2:10), 3, 3).';
J_0 = reshape(data1(11:19), 3, 3).';
J_m120 = reshape(data1(20:28), 3, 3).';
J_p120 = reshape(data1(29:37), 3, 3).';
%%%%%% INITIATION OF VARS + INPUT FILE (END) %%%%%%
%%%%%% FILLING THE PRISTINE HAMILTONIAN == H0 == M (BEGIN) %%%%%%
M = fill_big_matrix_M(N,A,J_0,J_m120,J_p120);
%%%%%% FILLING THE 'BIG' MATRIX == M (END) %%%%%%
%%%%%% VARIATION OF B (BEGIN) %%%%%%
Sinit = zeros(3*N,1);
for l = 1:1:N
  Sinit(3*l-2,1) = 1e-1;
  Sinit(3*l,1) = -sqrt(S*S-Sinit(3*l-2,1)*Sinit(3*l-2,1));
end
Bstart = -50; Bend = 50; Bstep = 0.25; 
dynamic_B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep);
%%%%%% VARIATION OF B (END) %%%%%%

