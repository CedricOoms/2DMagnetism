function hysteresis = B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep)
hysteresis = zeros((Bend-Bstart)/Bstep+1,2);
uB = 5.788381e-2; g = 2; %Bohr magneton in meV/T% and g tensor == g factor (isotropic)%

for B = Bstart:Bstep:Bend
%%%%%% FILLING THE MAGN. PART OF THE HAMILTONIAN == HB (BEGIN) %%%%%%
Bx = B*sind(theta)*cosd(phi);
By = B*sind(theta)*sind(phi);
Bz = B*cosd(theta);
B_vec = zeros(3*N,1);
% HB = zeros(3*N,1);
for i = 1:1:N
B_vec(3*i-2,1) = Bx;
B_vec(3*i-1,1) = By;
B_vec(3*i,1) = Bz;
end
HB = -uB*g*B_vec;
%%%%%% FILLING THE MAGN. PART OF THE HAMILTONIAN == HB (END) %%%%%%
%%%%%% SEARCHING EXTREMUMS OF THE HAMILTONIAN WITH THE CONSTRAINT OF NORMED SPINS (BEGIN) %%%%%%
S3N = minimize_H(N,S,Sinit,M,HB);
hysteresis(floor((B-Bstart)/Bstep+1),:) = [B S3N(3,1)];
end