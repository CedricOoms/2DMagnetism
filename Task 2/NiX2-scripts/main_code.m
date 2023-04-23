clear
close all
clc
P = 8; S = 1; n = linspace(1,P^2,P^2)'; %P**2 = number of particles (8x8 system)

[FirstNN,SecondNN,ThirdNN] = determine_NNs(P);
plot_matrix(P,n,FirstNN,SecondNN,ThirdNN);  %% for visual control of nearest neighbors

isoJ1 = -7.0; isoJ2 = -0.3; isoJ3 = 5.8;
xx = -1.0; yy = +1.4; zz = -0.3; yz = -1.4; %% other off-diagonal elements xz zx xy yx all 0 %%

J1_000 = isoJ1.*eye(3) + [xx 0 0;0 yy yz;0 yz zz]; J2 = isoJ2.*eye(3); J3 = isoJ3.*eye(3); 
R_120 = rotation_matrix(120); R_240 = rotation_matrix(240);
J1_120 = R_120'*J1_000*R_120; J1_240 = R_240'*J1_000*R_240;
%%% create big Hamiltonian begin %%%
H = zeros(3*P^2,3*P^2);

for k = 1:1:P^2
    H(3*k-2:3*k,3*FirstNN(k,1)-2:3*FirstNN(k,1)) = J1_000;
    H(3*k-2:3*k,3*FirstNN(k,4)-2:3*FirstNN(k,4)) = J1_000;
    H(3*k-2:3*k,3*FirstNN(k,2)-2:3*FirstNN(k,2)) = J1_120;
    H(3*k-2:3*k,3*FirstNN(k,5)-2:3*FirstNN(k,5)) = J1_120;
    H(3*k-2:3*k,3*FirstNN(k,3)-2:3*FirstNN(k,3)) = J1_240;
    H(3*k-2:3*k,3*FirstNN(k,6)-2:3*FirstNN(k,6)) = J1_240;
    
    for l = 1:1:6
        H(3*k-2:3*k,3*SecondNN(k,l)-2:3*SecondNN(k,l)) = J2; 
        H(3*k-2:3*k,3*ThirdNN(k,l)-2:3*ThirdNN(k,l)) = J3;
    end
end
%%% create big Hamiltonian  end  %%%
maxiter = 1000; MCansambl = 10; F = zeros(maxiter,MCansambl); 
Fbegin = zeros(1,MCansambl); Fend = zeros(1,MCansambl); 

for MC = 1:1:MCansambl
    %%% initial spin configuration begin %%%
        a = zeros(3,1);
    for k = 1:1:P^2
        a(:,k) = 2.*rand(3,1)-1; a(:,k) = a(:,k)./norm(a(:,k)).*S;
    end
    a_3Nx1_init = reshape(a,3*P^2,1);           
    %%% initial spin configuration  end  %%%
    %%% minimizing H begin %%%
    diff = ones(3*P^2,1); zbir = diff; tol = 1e-6;
    a_3Nx1_tmp = a_3Nx1_init;

    cntr = 1; E0 = a_3Nx1_init'*H*a_3Nx1_init;
    mixtmp = -1; mixnew = 1-mixtmp;

    while(((norm(diff) > tol) && (norm(zbir) > tol)) && (cntr < maxiter))
        a_3Nx1_new = H*a_3Nx1_tmp;
        a_3xN_new = reshape(a_3Nx1_new,3,P^2);
        for k = 1:1:P^2
            a_3xN_new(:,k) = a_3xN_new(:,k)./norm(a_3xN_new(:,k)).*S;
        end
        a_3Nx1_new = reshape(a_3xN_new,3*P^2,1);
        diff = a_3Nx1_new - a_3Nx1_tmp;
        zbir = a_3Nx1_new + a_3Nx1_tmp;
        Etmp = a_3Nx1_tmp'*H*a_3Nx1_tmp; Enew = a_3Nx1_new'*H*a_3Nx1_new;
        if Enew < Etmp
            a_3Nx1_tmp = a_3Nx1_new;
        else
            a_3Nx1_tmp = mixtmp.*a_3Nx1_tmp + mixnew.*a_3Nx1_new;
            a_3xN_tmp = reshape(a_3Nx1_tmp,3,P^2);
            for k = 1:1:P^2
                a_3xN_tmp(:,k) = a_3xN_tmp(:,k)./norm(a_3xN_tmp(:,k)).*S;
            end
            a_3Nx1_tmp = reshape(a_3xN_tmp,3*P^2,1);
        end
        cntr = cntr + 1;
        E0 = [E0;a_3Nx1_tmp'*H*a_3Nx1_tmp];
    end
    %%% minimizing H end %%%
F(1:length(E0),MC) = E0;
Fbegin(1,MC) = F(1,MC);
Fend(1,MC) = F(find(F(:,MC),1,'last'),MC); 
end
Fbegin = Fbegin';Fend = Fend';

%%% plot of the last MC configuration with only arrows begin %%%
coord = load('8x8-NiI2.txt');
X = coord(:,1);Y = coord(:,2);Z = coord(:,3);
a = a_3xN_new';
U = a(:,1);V = a(:,2);W = a(:,3);
figure
pl=quiver3(X,Y,Z,U,V,W,0.2,'r');
pl.LineWidth=0.95;
axis equal
%%% plot of the last MC configuration with only arrows  end  %%%
%%% plot of the last MC configuration with arrows + color begin %%%
Xr = reshape(X,P,P);Yr = reshape(Y,P,P);Wr = reshape(W,P,P);
X2 = min(X):0.1:max(X);Y2 = min(Y):0.1:max(Y);
[X2,Y2] = meshgrid(X2,Y2);
W2 = griddata(Xr,Yr,Wr,X2,Y2,'cubic');
figure
hold on
quiver3(X,Y,Z,U,V,W,0.2,'k-','filled');
axis equal
surf(X2,Y2,W2);
hold off
%%% plot of the last MC configuration with arrows + color  end  %%%
axis equal