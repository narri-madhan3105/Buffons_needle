%% Buffon's Needle Convergence to Pi
% Law of Large Numbers Demonstration

clc;
clear;
close all;

%% Parameters
L = 1;          % Needle length
D = 1;          % Distance between parallel lines
N = 1000;     % Number of throws

hits = 0;
pi_est = zeros(N,1);

%% Simulation
for n = 1:N

    % Distance from nearest line (0 to D/2)
    y = (D/2) * rand();

    % Random angle (0 to pi/2)
    theta = (pi/2) * rand();

    % Needle crosses?
    if (L/2)*sin(theta) >= y
        hits = hits + 1;
    end

    % Running estimate of pi
    if hits > 0
        pi_est(n) = (2*n)/hits;
    else
        pi_est(n) = NaN;
    end

end

%% Plot

figure('Color','k','Position',[100 100 900 550])

plot(1:N,...
     pi_est,...
     'o',...
     'MarkerSize',6,...
     'MarkerEdgeColor',[0 0.4470 0.7410],...
     'MarkerFaceColor','none');
hold on

% True value of pi
yline(pi,...
    'r--',...
    'LineWidth',2);

grid on

set(gca,...
    'Color','k',...
    'XColor','w',...
    'YColor','w',...
    'GridColor',[0.6 0.6 0.6],...
    'GridAlpha',0.3,...
    'FontSize',12);

xlabel('Number of throws, n',...
    'Color','w',...
    'FontSize',13);

ylabel('Estimate of \pi',...
    'Color','w',...
    'FontSize',13);

title('Estimated value of \pi vs. n',...
    'Color','w',...
    'FontWeight','bold',...
    'FontSize',16);

xlim([1 N])
ylim([2.95 3.30])

legend('Estimated \pi',...
    'True \pi',...
    'TextColor','w',...
    'Location','best');

fprintf('Estimated pi = %.6f\n',pi_est(end));
fprintf('Actual pi    = %.6f\n',pi);
fprintf('Error        = %.6f\n',abs(pi_est(end)-pi));