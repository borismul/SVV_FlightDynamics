%% The period and damping for a given eigenvalue
%  
%
%  by Robert

function [ eig, T_5, P ] = PeriDamp4Eig( eig, c, V )

T_5 = zeros(length(eig),1);
P   = zeros(length(eig),1);

for i = 1:length(eig)
    if isreal(eig(i)) % For real eigenvalues
        T_5(i) = log(.5) * c / (eig(i) * V) ;
        P(i)   = 0 ;
    else % For complex eigenvalues
        T_5(i) = log(.5) * c / ( real(eig(i)) * V) ;
        P(i)   = 2* pi() * c / ( imag(eig(i)) * V) ;
    end
end

end