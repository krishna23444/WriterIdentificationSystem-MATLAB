function [x Idx] = bubblesort(x)
%--------------------------------------------------------------------------
% Syntax:       sx = bubblesort(x);
%               
% Inputs:       x is a vector of length n
%               
% Outputs:      sx is the sorted (ascending) version of x
%               
% Description:  This function sorts the input array x in ascending order
%               using the bubble sort algorithm
%               
% Complexity:   O(n)      best-case performance
%               O(n^2)    average-case performance
%               O(n^2)    worst-case performance
%               O(1)      auxiliary space
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         January 5, 2014
%--------------------------------------------------------------------------

% Bubble sort
n = length(x);
Idx=1:n;
while (n > 0)
    % Iterate through x
    nnew = 0;
    for i = 2:n
        % Swap elements in wrong order
        if (x(i) < x(i - 1))
            [x Idx] = swap(x,Idx,i,i - 1);
            nnew = i;						
        end
    end
    n = nnew;
end

end

function [x Idx] = swap(x,Idx,i,j)
% Swap x(i) and x(j)
% Note: In practice, x xhould be passed by reference
%%disp(x);
val = x(i);
x(i) = x(j);
x(j) = val;

%%disp(Idx);
val=Idx(i);
Idx(i) = Idx(j);
Idx(j) = val;

end
