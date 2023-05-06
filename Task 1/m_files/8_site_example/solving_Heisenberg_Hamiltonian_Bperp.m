%%%%%% FILLING THE PRISTINE HAMILTONIAN == H0 == M (BEGIN) %%%%%%
M = fill_big_matrix_M(N,A,J_0,J_m120,J_p120);
%%%%%% FILLING THE 'BIG' MATRIX == M (END) %%%%%%
%%%%%% VARIATION OF B (BEGIN) %%%%%%
Sinit = zeros(3*N,1);
for l = 1:1:N
  Sinit(3*l-2,1) = 1e-1;
  Sinit(3*l,1) = -sqrt(S*S-Sinit(3*l-2,1)*Sinit(3*l-2,1));
end
hysteresis1 = B_swipe_Bperp(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep);
hysteresis2 = B_swipe_Bperp(N,S,M,-Sinit,theta,phi,Bend,Bstart,-Bstep);
% %%%%%% VARIATION OF B (END) %%%%%%
figure();
title("Hysteresis loop using only perpendicular component of a tilted applied field (w.r.t. the sample)");
subtitle(sprintf("Theta = %d °",theta));
xlabel("Perpendicular component of applied field")
ylabel("Measured field")
hold on
plot(hysteresis1(:,1),hysteresis1(:,2),'k-*');
plot(hysteresis2(:,1),hysteresis2(:,2),'r-*');
hold off
xlim([Bstart Bend]);
ylim([-4/3*S 4/3*S]);
