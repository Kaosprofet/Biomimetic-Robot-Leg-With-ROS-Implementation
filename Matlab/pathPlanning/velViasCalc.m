function [velVias] = velViasCalc(thetaVias,velLim)
%velViasCalc generates velocity limitations for all waypoints
%   This function takes an absolute value for the velocity limit and adds
%   the correct sign for the direction of the joint. If the direction
%   changes the velocity is set to 0.

    [numActuators, numVias] = size(thetaVias);
    velVias = zeros(numActuators, numVias);
    
    for i = 1:numActuators
        for j = 2:numVias-1
            if thetaVias(i,j-1) > thetaVias(i,j) && thetaVias(i,j) > thetaVias(i,j+1)
                velVias(i,j) = -velLim;
            elseif thetaVias(i,j-1) < thetaVias(i,j) && thetaVias(i,j) < thetaVias(i,j+1)
                velVias(i,j) = velLim;
            else
                velVias(i,j) = 0;
            end
        end
    end    
end

