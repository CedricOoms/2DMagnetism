function dynamic_B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep)
    figure(1);
    hold on;
    hysteresis1 = B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep);
    hysteresis2 = B_swipe(N,S,M,-Sinit,theta,phi,Bend,Bstart,-Bstep);
    hold on
    plot(hysteresis1(:,1),hysteresis1(:,2),'k-*');
    plot(hysteresis2(:,1),hysteresis2(:,2),'r-*');
    hold off;
    i=1;
    while Bend >= 10
        Bend=Bend-(Bend/2);
        hysteresis1 = B_swipe(N,S,M,Sinit,theta,phi,Bstart,Bend,Bstep);
        Bstart=-Bend;
        hysteresis2 = B_swipe(N,S,M,-Sinit,theta,phi,Bend,Bstart,-Bstep);
        Bstart
        Bend
        figure(i+1);
        hold on
        plot(hysteresis1(:,1),hysteresis1(:,2),'k-*');
        plot(hysteresis2(:,1),hysteresis2(:,2),'r-*');
        hold off

    end
    hold off;
end