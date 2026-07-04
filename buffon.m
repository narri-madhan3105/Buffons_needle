%% buffon_needle_animation.m
% Buffon's Needle Animation
% Estimates pi using Monte Carlo Simulation

clc;
clear;
close all;

%% Parameters
nRuns = 500;          % Number of needles
needleLength = 1;     % Needle length

nHits = 0;

%% Create Figure
figure('Color','k','Position',[100 100 800 800]);

hold on;
axis([0 12 0 12]);
axis square;

% Horizontal lines
for y = 1:11
    yline(y,'w','LineWidth',2);
end

grid on

grid on

ax = gca;

ax.Color = [0.08 0.08 0.08];
ax.XColor = 'w';
ax.YColor = 'w';

ax.GridLineStyle = ':';      % Dotted
ax.GridColor = [0.8 0.8 0.8];
ax.GridAlpha = 0.25;

ax.LineWidth = 1.2;
ax.FontSize = 12;
xlabel('X','Color','w','FontSize',12)
ylabel('Y','Color','w','FontSize',12)

title('Buffon''s Needle Simulation',...
    'Color','w',...
    'FontSize',18,...
    'FontWeight','bold')

%% Animation

for i = 1:nRuns

    % Random starting point
    x1 = 10*rand + 1;
    y1 = 10*rand + 1;

    % Random direction
    theta = 2*pi*rand;

    % End point
    x2 = x1 + needleLength*cos(theta);
    y2 = y1 + needleLength*sin(theta);

    % Check intersection
    hit = ceil(min(y1,y2)) == floor(max(y1,y2));

    if hit
        nHits = nHits + 1;
        colour = 'r';          % Red = Hit
    else
        colour = [0 1 1];      % Cyan = Miss
    end

    % Draw needle
    plot([x1 x2],...
         [y1 y2],...
         'Color',colour,...
         'LineWidth',2);

    % Draw starting point
    plot(x1,y1,'.',...
        'Color',colour,...
        'MarkerSize',12);

    % Calculate pi estimate
    prob = nHits/i;

    if prob > 0
        piEstimate = 2/prob;
    else
        piEstimate = NaN;
    end

    % Update title
    title(sprintf(['Buffon''s Needle Simulation\n' ...
        'Needles: %d    Hits: %d    Estimated \\pi = %.5f'],...
        i,nHits,piEstimate),...
        'Color','w',...
        'FontSize',17,...
        'FontWeight','bold');

    drawnow;
    frame = getframe(gcf);
    img = frame2im(frame);
    [A,map] = rgb2ind(img,256);

    if i == 1
        imwrite(A,map,'buffon_animation.gif',...
            'gif',...
            'LoopCount',Inf,...
            'DelayTime',0.03);
    else
        imwrite(A,map,'buffon_animation.gif',...
            'gif',...
            'WriteMode','append',...
            'DelayTime',0.03);
    end
    pause(0.03);

end

%% Final Results
fprintf('---------------------------------\n');
fprintf('Total Needles      : %d\n',nRuns);
fprintf('Intersections      : %d\n',nHits);
fprintf('Estimated Pi       : %.6f\n',piEstimate);
fprintf('Actual Pi          : %.6f\n',pi);
fprintf('Absolute Error     : %.6f\n',abs(piEstimate-pi));
fprintf('---------------------------------\n');