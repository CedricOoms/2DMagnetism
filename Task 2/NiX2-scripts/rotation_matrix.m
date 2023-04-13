function R_alpha = rotation_matrix(alpha)
R_alpha = [cosd(alpha) -sind(alpha) 0;sind(alpha) cosd(alpha) 0; 0 0 1];
end