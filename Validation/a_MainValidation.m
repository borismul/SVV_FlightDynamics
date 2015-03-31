clear all
close all
clc

% Main validation file
load('flightdata.mat')

%Comman variables
theta = flightdata.Ahrs1_Pitch.data;
t = flightdata.Gps_utcSec.data;
Fused = (flightdata.lh_engine_FU.data + flightdata.rh_engine_FU.data)*0.45359237;
hp = flightdata.Dadc1_alt.data*0.3048;
Mstart = 812.5 + 2800*0.45359237 + 9170*0.45359237;

%Symmetric variables
q = flightdata.Ahrs1_bPitchRate.data;
u = flightdata.Dadc1_tas.data*0.51444;
alpha = flightdata.vane_AOA.data;
d_e = flightdata.delta_e.data;

%Asymmetric variables
beta = flightdata.Fms1_trueHeading.data;
phi = flightdata.Ahrs1_Roll.data;
p = flightdata.Ahrs1_bRollRate.data;
r = flightdata.Ahrs1_bYawRate.data;
d_r = flightdata.delta_r.data;
d_a = flightdata.delta_a.data;

% loading numerical data
load('Simulation/DutchRoll')
load('Simulation/Phugoid')
load('Simulation/AperiodicRoll')
load('Simulation/ShortPeriod')
load('Simulation/SpiralRoll')

%% Loop through all Simulation files
SimulationFiles = dir('Simulation/*.mat') ;
for i = 1:length(SimulationFiles)
    
    % Collect CaseName and SystemFile from SystemFiles
    SimulationFile = SimulationFiles(i).name ;
    CaseName = SimulationFile(1:end-4) ;
    
    switch CaseName
        case {'Phugoid','ShortPeriod','AperiodicRoll','DutchRoll','SpiralRoll'}
            % Load input variables from testflight
            load(['Simulation/' SimulationFile]);
        otherwise
            symmetry = '';
    end
    
    switch CaseName
        case 'Phugoid'
            % Start 32692
            % End 34471
            t_sp = t-t(32692) ;
            range = 32692:34471 ;
            symmetry = 'symmetric' ;
        case 'ShortPeriod'
            % Start 29222
            % End 29363
            t_sp = t-t(29222) ;
            range = 29222:29363 ;
            symmetry = 'symmetric' ;
        case 'AperiodicRoll'
            % Start 31297
            % End 31406
            t_sp = t-t(31297);
            range = 31297:31406;
            symmetry = 'asymmetric' ;
        case 'DutchRoll'
            % Start 27727
            % End 27931
            t_sp = t-t(27727);
            range = 27727:27931;
            symmetry = 'asymmetric' ;
        case 'SpiralRoll'
            % Start 37107
            % End 38021
            t_sp = t-t(36707);
            range = 36707:38021;
            symmetry = 'asymmetric' ;
    end
    
    switch symmetry
        case 'symmetric'
            figure('Name', CaseName);
            for j = 1:5
                subplot(5,1,j)
                hold on
                switch j
                    case 1
                        plot(t_sp(range),u(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,1),''g'')']);
                        title('True airspeed vs time')
                        ylabel('V_t [m/s]')
                        legend('Validation Data', 'Numerical Model')
                    case 2
                        plot(t_sp(range),alpha(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,2),''g'')']);
                        title('Angle of attack vs time')
                        UNIT = sprintf('[%c]', char(176));
                        ylabel(['\alpha ' UNIT])
                    case 3
                        plot(t_sp(range),theta(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,3),''g'')']);
                        title('Pitch angle vs time')
                        UNIT = sprintf('[%c]', char(176));
                        ylabel(['\Theta ' UNIT])
                    case 4
                        plot(t_sp(range),q(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,4),''g'')']);
                        title('Pitch rate vs time')
                        UNIT = sprintf('[%c/s]', char(176));
                        ylabel(['q ' UNIT])
                    case 5
                        plot(t_sp(range),d_e(range),'r')
                        title('Elevator deflection vs time')
                        UNIT = sprintf('[%c]', char(176));
                        ylabel(['\delta_e ' UNIT])
                        % only the lower plot needs an xlabel
                        xlabel('t [s]')
                end
            end
            hp0 = hp(range(1));
            V0 = u(range(1));
            alpha0 = alpha(range(1));
            theta0 = theta(range(1));
            m0 = Mstart - Fused(range(1));
            SendToSimulation(t_sp(range),d_e(range),hp0,V0,alpha0,theta0,m0,CaseName);
            
            % Save as .png-image
            print(['results/' CaseName '.png'],'-dpng')
            close
            
        case 'asymmetric'
            figure('Name', CaseName);
            for j = 1:5
                subplot(5,1,j)
                hold on
                switch j
                    case 1
                        plot(t_sp(range),beta(range)-beta(range(1)))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,1),''g'')']);
                        title('Yaw angle vs time')
                        UNIT = sprintf('[%c]', char(176));
                        ylabel(['\beta ' UNIT ])
                        legend('Validation Data', 'Numerical Model')
                    case 2
                        plot(t_sp(range),phi(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,2),''g'')']);
                        title('Roll angle vs time')
                        UNIT = sprintf('[%c]', char(176));
                        ylabel(['\phi ' UNIT])
                    case 3
                        plot(t_sp(range),p(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,3),''g'')']);
                        title('Roll rate vs time')
                        UNIT = sprintf('[%c/s]', char(176));
                        ylabel(['p ' UNIT])
                    case 4
                        plot(t_sp(range),r(range))
                        eval(['plot(T_' CaseName ',Y_' CaseName '(:,4),''g'')']);
                        title('Yaw rate vs time')
                        UNIT = sprintf('[%c/s]', char(176));
                        ylabel(['r ' UNIT])
                    case 5
                        UNIT = sprintf('[%c]', char(176));
                        if strcmp(CaseName, 'DutchRoll')
                            plot(t_sp(range),d_r(range),'r')
                            title('Rudder deflection vs time')
                            ylabel(['\delta_r ' UNIT])
                        else
                            plot(t_sp(range),d_a(range),'r')
                            title('Aileron deflection vs time')
                            ylabel(['\delta_a ' UNIT])
                        end
                        xlabel('t [s]')
                end
            end
            hp0 = hp(range(1));
            V0 = u(range(1));
            alpha0 = alpha(range(1));
            theta0 = theta(range(1));
            m0 = Mstart - Fused(range(1));
            if strcmp(CaseName,'DutchRoll')
                SendToSimulation(t_sp(range),d_r(range),hp0,V0,alpha0,theta0,m0,CaseName);
            else
                SendToSimulation(t_sp(range),d_a(range),hp0,V0,alpha0,theta0,m0,CaseName);
            end
            
            % Save as .png-image
            print(['results/' CaseName '.png'],'-dpng')
            close
            
            end
    
    clearvars symmetry
end