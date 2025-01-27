function [J] = symCalcJ(dh)
%sumCalcJ calculates the Jacobi matrix for any given robot configuration
%   By defining the Denavit Hartenberg table with an extra row for
%   rotational or translational joints the Jacobi matrix can be calculated
%   directly from the DH-table
    
    n = length(dh(:,1)); %number of links
    Jv = sym('Jv', [3 n]);
    Jw = sym('Jw', [3 n]);
    
    T = symCalcT(dh);

    for i = 1:n
        type = dh(i,5);
        if lower(type) == "rot"
            if i == 1
                Jv(1:3, i) = cross([0;0;1],(T(1:3, 4, n) - [0;0;0]));
                Jw(1:3, i) = sym([0;0;1]);
            else
                Jv(1:3, i) = cross(T(1:3, 3, i-1),(T(1:3, 4, n) - (T(1:3, 4, i-1))));
                Jw(1:3, i) = T(1:3, 3, i-1);
            end     
        else
            if i == 1
                Jv(1:3, i) = [0;0;0];
            else
                Jv(1:3, i) = T(1:3, 3, i-1);
            end      
            Jw(i,1:3) = 0;
        end
    end

    J = [Jv;Jw];
end