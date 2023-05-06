clear; close all;
%%Initialize material variables:
fid = fopen('input_J_A_CrI_3.dat', 'r');
data1 = fscanf(fid, '%f');
N = data1(1);     %% number of sites/magnetic moments 
S = 1.5;          %% magnitude of spins
A = reshape(data1(2:10), 3, 3).';
J_0 = reshape(data1(11:19), 3, 3).';
J_m120 = reshape(data1(20:28), 3, 3).';
J_p120 = reshape(data1(29:37), 3, 3).';

%Applied magnetic field settings:
theta = 60; phi = 0;
Bstart = -12; Bend = 12; Bstep = 0.25; 

%Run calculations:
solving_Heisenberg_Hamiltonian;
fid = fopen('input_J_A_CrI_3.dat', 'r');
solving_Heisenberg_Hamiltonian_Bperp;
