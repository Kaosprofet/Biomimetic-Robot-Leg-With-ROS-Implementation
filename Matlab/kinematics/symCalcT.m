function [T] = symCalcT(dh)
%symCalcT calculates all T matrices from base link to end effector for any robot configuration.
%By declaring A symbolic, the function enables symbolic calculation but it can be used numerically
    
    A = symCalcA(dh);

    n = length(dh(:,1)); %number of links
    T = sym('T', [4 4 n]);  
    
    T(:,:,1) = A(:,:,1);
    for i = 2:1:n
        T(:,:,i) = T(:,:,i-1)*A(:,:,i);
    end
end

