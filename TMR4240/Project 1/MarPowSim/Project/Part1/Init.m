%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
%
% Init.m
%
% Project:	"Marine Cybernetics Simulator: MCSim"
%
% Abstract:	Initialize simulation and start Simulink
% 
% Inputs:	-
%
% Outputs:	-
%	
% Calls:        Parameters
%               Load_vessel_data
%               Thruster_data
%               Exp_environ
%               Wind_spectrum
%               Init_Waves
%               MCSim
%
% Author:       Øyvind Smogeli, Autumn 2002
% Revision:     Vahid Hassani, Summer 2010
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

disp(' ')
disp('***********************************************************')

% Set simulation parameters
Parameters;




    % Read the vessel data
    Par.Vessel = Load_vessel_data(Sim.vessno);

%     % Load thruster data 
%     Par.Thruster = Thruster_config;
% 
%     % Load sensor data
%     Sensor_data;
% 
%     % Calculate expectation values for waves and wind based on Hs if wanted
%     Par.Wind = Exp_environ(Par.Wave, Par.Wind, Par.Vessel.wind_arm_y);
% 
%     % Initialize wind gust components from spectrum 
%     Par.Wind = Wind_spectrum(Par.Wind, Par.Vessel.wind_arm_y);
% 
%     % Initialize wave components from spectrum
%     % Par.Wave = Init_Waves(Par.Wave);
% 
% 
% 
% % Load controller settings
% Controls;


% Define matrix of thrust losses do be displayed
loss_string = '    Thrust losses: Wave  CC  Vent  Damp  Wag';
for count = 1:Sim.nthrusters

	if Sim.Thruster_enable(count) == 1
	
		loss_string = sprintf('%s\n      Thruster %1.0f:    %1.0f    %1.0f    %1.0f     %1.0f    %1.0f',...
			loss_string, count, Sim.Thruster{count}.Wavecalc, Sim.Thruster{count}.Cc_loss,...
			Sim.Thruster{count}.Vent_loss, Sim.Thruster{count}.Hydro_damp, Sim.Thruster{count}.Wagner);
		
	end
		
end


% Display initialization confirmation
yesno{1} = 'No';
yesno{2} = 'Yes';

disp(' ')
disp('***********************************************************')
disp('*                    MCSIM INITIALIZED                    *')
disp('***********************************************************')
disp(' ')
disp(['  Vessel: ', Par.Vessel.name])
disp(['  Using WF model: ', yesno{Sim.WF_model + 1}])
disp(['  Using LF model: ', yesno{Sim.LF_model + 1}])
disp(' ')
if Sim.LF_model == 1
	disp('  Load modules: ')
	disp(['    Wind:      ', yesno{Sim.Wind_load + 1}])
	disp(['    Current:   ', yesno{Sim.Current_load + 1}])
	disp(['    Wavedrift: ', yesno{Sim.Wavedrift_load + 1}])
	disp(' ')
	if sum(Sim.Ext_force) ~= 0
		disp(['    NB! External force: [', num2str(Sim.Ext_force), ']'])
		disp(['            Applied at: [', num2str(Sim.Ext_force_coord), ']'])
		disp(' ')
	end
end
disp(['  Vessel Control: ', yesno{Sim.Vessel_Control + 1}])
% if Sim.Vessel_Control == 1
% 	disp(sprintf('    Controller      : %s ',Control.Types{Control.Type}))
% 	disp(sprintf('    Feedback signal : %s ', Sim.Sensor.Feedback{Sim.Ideal_meas + 1}))
% 	disp(sprintf('    Sensor models   : %s ', Sim.Sensor.Types{Sim.Sensors + 1}))
% 	disp(sprintf('    Observer        : %s ',Sim.VessObs.Types{Sim.Vessel_Observer + 1}))
% end
disp(' ')
disp (['  Thruster dynamics: ', yesno{Sim.Thrusters.Enable + 1}])
if Sim.Thrusters.Enable == 1
	disp(sprintf('    Thrust allocation: %s ',Control.Alloc.Types{Control.Alloc.Type}))
	disp(['    Thruster types and controllers: '])
	for cc = 1:Sim.nthrusters
		if Sim.Thruster_enable(cc) == 1
			disp(sprintf('      Thruster %d: %s\n                  %s',cc,Par.Thruster{cc}.descr,Control.Thruster{cc}.Types{Control.Thruster{cc}.Type}))
		end	
	end
	disp(loss_string)
end
disp(' ')
disp(['  Re-initialization of environment: ', yesno{2}])
if Par.Wind.gust == 1
	disp(sprintf('    Wind gust spectrum       : %s', Par.Wind.spectypes{Par.Wind.spectrum}))
end
disp(['    Varying wind direction   : ', yesno{Par.Wind.var_dir + 1}])
disp(['    Varying current magnitude: ', yesno{Par.Current.var_vel + 1}])
disp(['    Varying current direction: ', yesno{Par.Current.var_dir + 1}])
%if Sim.WF_model == 1 | (Sim.Thrusters.Enable == 1 & Sim.Thruster{1}.Wavecalc == 1) | Sim.Wavedrift_load == 1 % Display wave info only if it is used in simulation
%	disp(sprintf('    Wave spectrum            : %s', Par.Wave.spectypes{Par.Wave.spectrum}))
%	disp(['    Harmonic wave components : ', num2str(length(Par.Wave.Zeta_a))])
%	disp(['    Random wave frequencies  : ', yesno{Par.Wave.rand_freq + 1}])
%	disp(['    Random wave directions   : ', yesno{Par.Wave.rand_dir + 1}])
%	disp(['    Truncated wave components: ', num2str(Par.Wave.nfreq*Par.Wave.ndir - length(Par.Wave.Zeta_a))])
%end
disp(' ')
disp('***********************************************************')
disp(' ')
