if strcmp( CaseName, 'SpiralRoll' )
    
    CaseSym = 'asymmetric' ;
    CaseDefl = 'aileron' ;
    u = zeros(length(t),2) ;
    u(:,1) = defl ;
    
elseif strcmp( CaseName, 'AperiodicRoll' )
    
    CaseSym = 'asymmetric' ;
    CaseDefl = 'aileron' ;
    u = zeros(length(t),2) ;
    u(:,1) = defl ;
    
elseif strcmp( CaseName, 'DutchRoll' )
    
    CaseSym = 'asymmetric' ;
    CaseDefl = 'rudder' ;
    u = zeros(length(t),2) ;
    u(:,2) = -defl ;
    
elseif strcmp( CaseName, 'Phugoid' )
    
    CaseSym = 'symmetric' ;
    CaseDefl = 'elevator' ;
    u = defl;
    
elseif strcmp( CaseName, 'ShortPeriod' )
    
    CaseSym = 'symmetric' ;
    CaseDefl = 'elevator';
    u = defl ;
    
end