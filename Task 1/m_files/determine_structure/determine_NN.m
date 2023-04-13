% crystal = load('trig-400-atoms-MATLAB-POSCAR');
% crystal = load('sqr-200-atoms-MATLAB-POSCAR');
crystal = load('hex-200-atoms-MATLAB-POSCAR');
N = crystal(1,1);   %total number of magnetic sites
a = crystal(2:4,:); %lattice vectors
[l,w] = size(crystal); 

if ((l-4) ~= N) || (w ~= 3)
    disp('Number of atomic sites in file is incorrect, or each site does not have 3 Cartesian coordinates.');
else
    disp('Total number of atoms is OK and all atoms have 3 Cartesian coordinates!');
end

DirectAtomCoords = crystal(5:l,:);
CartesAtomCoords = DirectAtomCoords*a;
% scatter(CartesAtomCoords(:,1),CartesAtomCoords(:,2));
[X1,X2] = meshgrid(CartesAtomCoords(:,1)); xdist = X2-X1;
[Y1,Y2] = meshgrid(CartesAtomCoords(:,2)); ydist = Y2-Y1;
d = sqrt(xdist.*xdist+ydist.*ydist); 

c = sort(d(:,floor(N/2)+10));  % far from edges, magnetic site should have 'all' neighbors.
c1 = diff(c(1:20,1));
cdiff = int8(c1>0.1);

cdiff_hex = [1 0 0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1]';
cdiff_sqr = [1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0 0]';
cdiff_tri = [1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1]';

if cdiff == cdiff_hex
    NN1 = 3; NN2 = 6; NN3 = 3; d1 = c1(1); d2 = c1(4)+d1; d3 = c1(10)+d2;
    disp('Crystal lattice is hexagonal.');
elseif cdiff == cdiff_sqr
    NN1 = 4; NN2 = 4; NN3 = 4; d1 = c1(1); d2 = c1(5)+d1; d3 = c1(9)+d2;
    disp('Crystal lattice is square.');
elseif cdiff == cdiff_tri
    NN1 = 6; NN2 = 6; NN3 = 6; d1 = c1(1); d2 = c1(7)+d1; d3 = c1(13)+d2;
    disp('Crystal lattice is triangular.');
else
    NN1 = 0; NN2 = 0; NN3 = 0;
    disp('Crystal lattice is not hexagonal, int8(d>d1-0.1 & d<d1+0.1)square or trigonal. Please reconsider the crystal structure.');    
end
disp([d1 d2 d3]);
NNmatrix = 1.*int8(d>d1-0.1 & d<d1+0.1)+2.*int8(d>d2-0.1 & d<d2+0.1)+3.*int8(d>d3-0.1 & d<d3+0.1);