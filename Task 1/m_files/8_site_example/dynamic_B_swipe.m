function dynamic_B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep)
    figure(1);
    while Bend >= 10
        Bend=Bend-(Bend/2);
        hysteresis1 = B_swipe(N,S,M,Sinit,theta,phi,B,-B,-Bstep);
        hysteresis2 = B_swipe(N,S,M,-Sinit,theta,phi,-B,B,Bstep);
    end
    hold off;
end