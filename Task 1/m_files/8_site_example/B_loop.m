function B_loop(N,S,M,Sinit,theta,phi,B,Bstep)
    hysteresis1 = B_swipe(N,S,M,Sinit,theta,phi,B,-B,-Bstep);
    hysteresis2 = B_swipe(N,S,M,-Sinit,theta,phi,-B,B,Bstep);
    hold on
    plot(hysteresis1(:,1),hysteresis1(:,2),'k-*');
    plot(hysteresis2(:,1),hysteresis2(:,2),'r-*');
    hold off
end