function [] = plotAnimation(dh, baseHeight, thetaDiscrete, timeLine, fileName)
%plotAnimation creates and exports an animation of the robot
%  The thetaDiscrete matrix includes actuator angles for all time steps in
%  a complete gait.

    figure()
    
    %Preallocation 
    numFrames = length(timeLine);
    frames = struct('cdata',cell(1,numFrames),'colormap',cell(1,numFrames));
    dhMom = dh;
    for i = 1:numFrames
        clf;        %Clearing plot values
        dhMom(2:5,2) =  thetaDiscrete(:,i);
        plotRobot(dhMom, baseHeight); 
        frames(i) = getframe(gcf);
    end

    video = VideoWriter(fileName, 'MPEG-4');
    video.FrameRate = 10;

    open(video)
    writeVideo(video,frames);  
    close(video)
end