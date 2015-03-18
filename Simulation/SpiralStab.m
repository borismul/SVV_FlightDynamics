%% The spiral stability criterion
%  Function to check for the spiral stability criterion
%  As defined in the lecture notes on page 157
%
%  by Robert

function [ ] = SpiralStab( Clb, Clr, Cnb, Cnr )
%% Spiral stability criterion check

SSC = Clb*Cnr - Cnb*Clr ;

if SSC > 0
    disp(['Spiral stability criterion is met: ' num2str(SSC) ' > 0' ]);
    disp('The aircraft is spirally stable');
elseif SSC == 0
    disp(['Spiral stability criterion is not met: ' num2str(SSC) ' = 0' ]);
    disp('The aircraft is not spirally stable');
else
    disp(['Spiral stability criterion is not met: ' num2str(SSC) ' < 0' ]);
    disp('The aircraft is not spirally stable');
end

