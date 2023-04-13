function plot_matrix(P,n,FirstNN,SecondNN,ThirdNN)

f = figure();
f.Position = [1500 750 1000 1000];
hold on

p1 = plot(n-0.5,FirstNN(:,1)-0.5,'ksq');p1.MarkerFaceColor = [0.5 0 1];p1.MarkerSize = 10;
p2 = plot(n-0.5,FirstNN(:,2)-0.5,'ksq');p2.MarkerFaceColor = [0.1 0.7 1];p2.MarkerSize = 10;
p3 = plot(n-0.5,FirstNN(:,3)-0.5,'ksq');p3.MarkerFaceColor = [0.1 0.5 0.1];p3.MarkerSize = 10;
p4 = plot(n-0.5,FirstNN(:,4)-0.5,'ksq');p4.MarkerFaceColor = [0.5 0 1];p4.MarkerSize = 10;
p5 = plot(n-0.5,FirstNN(:,5)-0.5,'ksq');p5.MarkerFaceColor = [0.1 0.7 1];p5.MarkerSize = 10;
p6 = plot(n-0.5,FirstNN(:,6)-0.5,'ksq');p6.MarkerFaceColor = [0.1 0.5 0.1];p6.MarkerSize = 10;

d1 = plot(n-0.5,SecondNN(:,1)-0.5,'ksq');d1.MarkerFaceColor = [1 0.7 0];d1.MarkerSize = 10;
d2 = plot(n-0.5,SecondNN(:,2)-0.5,'ksq');d2.MarkerFaceColor = [0.5 0.1 0.5];d2.MarkerSize = 10;
d3 = plot(n-0.5,SecondNN(:,3)-0.5,'ksq');d3.MarkerFaceColor = [1 0.6 0.9];d3.MarkerSize = 10;
d4 = plot(n-0.5,SecondNN(:,4)-0.5,'ksq');d4.MarkerFaceColor = [1 0.7 0];d4.MarkerSize = 10;
d5 = plot(n-0.5,SecondNN(:,5)-0.5,'ksq');d5.MarkerFaceColor = [0.5 0.1 0.5];d5.MarkerSize = 10;
d6 = plot(n-0.5,SecondNN(:,6)-0.5,'ksq');d6.MarkerFaceColor = [1 0.6 0.9];d6.MarkerSize = 10;

t1 = plot(n-0.5,ThirdNN(:,1)-0.5,'ksq');t1.MarkerFaceColor = [0.0 0.0 0.0];t1.MarkerSize = 10;
t2 = plot(n-0.5,ThirdNN(:,2)-0.5,'ksq');t2.MarkerFaceColor = [0.0 1.0 0.6];t2.MarkerSize = 10;
t3 = plot(n-0.5,ThirdNN(:,3)-0.5,'ksq');t3.MarkerFaceColor = [0.0 0.5 0.5];t3.MarkerSize = 10;
t4 = plot(n-0.5,ThirdNN(:,4)-0.5,'ksq');t4.MarkerFaceColor = [0.0 0.0 0.0];t4.MarkerSize = 10;
t5 = plot(n-0.5,ThirdNN(:,5)-0.5,'ksq');t5.MarkerFaceColor = [0.0 1.0 0.6];t5.MarkerSize = 10;
t6 = plot(n-0.5,ThirdNN(:,6)-0.5,'ksq');t6.MarkerFaceColor = [0.0 0.5 0.5];t6.MarkerSize = 10;

hold off

set(gca, 'YDir','reverse')
% grid on
% grid minor
xlim([0 P^2]);
ylim([0 P^2]);
end