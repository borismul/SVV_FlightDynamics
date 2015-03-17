function [Re] = Reynolds(T,c,rho,V)

    mu = 1.458.*10.^-6.*T.^(3/2)./(T+110.4);
    Re = rho.*V.*c./mu;
end