clearvars; clc;

fs = 120; % 120 Hz sampling rate

% Read the Calc file
perceptionFilename = "DaiJumpAroundChar00.calc";
[skeletonNeuron, timeNeuron, rightFootContact, leftFootContact] = readCalc(perceptionFilename);
boneNames = {skeletonNeuron(:).Name};

% Read all the position matrices from the skeleton
posMat = [skeletonNeuron(:).Pos];

% Gte the skeleton parts order for the skeleton plot
skeletonOrder = [7,6,5,1,2,3,4,3,2,1,17,12,13,14,15,14,13,12,17,16,17,8,9,10,11];

% Plot the skeleton positions of the main parts
figure
downSampleRate = 5;
for i = 1:downSampleRate:length(posMat)
    
    % Get the x and y positions of the skeleton parts at this sample
    xPosMat = posMat(i,(skeletonOrder-1)*3+2);
    yPosMat = -posMat(i,(skeletonOrder-1)*3+3);
    
    plot(xPosMat,yPosMat,'LineWidth',1.5)
    xlabel('X (m)'); ylabel('Y (m)');
    ylim([-1.33,1.5])
    axis equal
    grid minor
    drawnow limitrate
    hold off
    pause(0.001);
end



