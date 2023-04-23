clc
clear
%%%%%% INITIATION OF VARS + INPUT FILE (BEGIN) %%%%%%
Binit=100;
Mat='CrBr_3';
fid = fopen(append('input_J_A_',Mat,'.dat'), 'r');
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
Bstart=-100; Bend=100; Bstep=0.25;
figure();
hold on;
while Bend >= 10
	Sinit = zeros(3*N,1);
	for l = 1:1:N
		Sinit(3*l-2,1) = 1e-1;
		Sinit(3*l,1) = -sqrt(S*S-Sinit(3*l-2,1)*Sinit(3*l-2,1));
	end
	hysteresis1 = B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep);
	hysteresis2 = B_swipe(N,S,M,-Sinit,theta,phi,Bend,Bstart,-Bstep);
	[Bstart,Bend]=B_decreaser(Bend); 
    Bstart=-Bstart;
	Clr=rand([1 3]);
	plot(hysteresis1(:,1),hysteresis1(:,2),'Color',Clr,'Marker','o');
	plot(hysteresis2(:,1),hysteresis2(:,2),'Color',Clr,Marker='*');
end
hold off;
%xlim([Bstart Bend]);
ylim([-4/3*S 4/3*S]);
title(append('Hysteresis ',Mat));
xlabel('Applied field (T)');
ylabel('Measured field (T)');
axis normal
xlim([-Binit,Binit])
