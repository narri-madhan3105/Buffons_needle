%% buffon_lln_animation.m
% Buffon's Needle + Law of Large Numbers
% Author: ChatGPT

clc;
clear;
close all;

%% Parameters
nRuns = 500;        % Increase to 5000 for smoother convergence
needleLength = 1;

hits = 0;
piEstimate = zeros(1,nRuns);

%% Figure

figure('Color','k','Position',[80 80 1400 650]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LEFT PANEL : Needles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,1)
hold on
axis([0 12 0 12])
axis square

set(gca,...
    'Color','k',...
    'XColor','w',...
    'YColor','w',...
    'FontSize',11);

xlabel('X','Color','w')
ylabel('Y','Color','w')

title('Buffon''s Needle','Color','w','FontSize',16)

% Parallel Lines
for y = 1:11
    plot([0 12],[y y],...
        'Color',[0.9 0.9 0.9],...
        'LineWidth',2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RIGHT PANEL : Convergence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,2)
hold on

set(gca,...
    'Color','k',...
    'XColor','w',...
    'YColor','w',...
    'FontSize',11);

grid on

plot([1 nRuns],[pi pi],...
    'r--',...
    'LineWidth',2);

xlabel('Number of Needles','Color','w')
ylabel('\pi Estimate','Color','w')

title('Law of Large Numbers','Color','w','FontSize',16)

xlim([1 nRuns])
ylim([2.5 4])

estimatePlot = animatedline(...
    'Color','cyan',...
    'LineWidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Animation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:nRuns

    %% Generate Needle

    x1 = 10*rand + 1;
    y1 = 10*rand + 1;

    theta = 2*pi*rand;

    x2 = x1 + needleLength*cos(theta);
    y2 = y1 + needleLength*sin(theta);

    %% Check Hit

    hit = ceil(min(y1,y2)) == floor(max(y1,y2));

    if hit
        hits = hits + 1;
        colour = [1 0.2 0.2];     % Red
    else
        colour = [0 1 1];         % Cyan
    end

    %% Draw Needle

    subplot(1,2,1)

    % Shadow
    plot([x1 x2],[y1 y2],...
        'k',...
        'LineWidth',4);

    % Needle
    plot([x1 x2],[y1 y2],...
        'Color',colour,...
        'LineWidth',2);

    % Needle eye
    scatter(x1,y1,...
        18,...
        [0.85 0.85 0.85],...
        'filled');

    % Needle tip
    scatter(x2,y2,...
        8,...
        colour,...
        'filled');

    %% Estimate Pi

    p = hits/i;

    if p>0
        piEstimate(i)=2/p;
    else
        piEstimate(i)=NaN;
    end

    %% Update Graph

    subplot(1,2,2)

    addpoints(estimatePlot,...
        i,...
        piEstimate(i));

    %% Statistics

    sgtitle(sprintf([...
        'Needles = %d      Hits = %d      ',...
        'Estimated \\pi = %.6f      ',...
        'True \\pi = %.6f      ',...
        'Error = %.6f'],...
        i,...
        hits,...
        piEstimate(i),...
        pi,...
        abs(piEstimate(i)-pi)),...
        'Color','w',...
        'FontSize',16,...
        'FontWeight','bold');

    drawnow

    pause(0.01)

end

%% Final Results

fprintf('\n');
fprintf('-------------------------------\n');
fprintf('Needles         : %d\n',nRuns);
fprintf('Hits            : %d\n',hits);
fprintf('Estimated Pi    : %.6f\n',piEstimate(end));
fprintf('Actual Pi       : %.6f\n',pi);
fprintf('Absolute Error  : %.6f\n',abs(piEstimate(end)-pi));
fprintf('-------------------------------\n');