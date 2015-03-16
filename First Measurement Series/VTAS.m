%Created on 10-3 by Christel

function [V_TAS] = VTAS(a,M)
    V_TAS = M.*a;
    
    if sum(M<0) ~=0
        error('One of the Machnumbers is smaller than zero')
    end
    
    if sum(a<=0) ~=0
        error('One of the speeds of sounds is <= zero')
    end
    
    
end