function Par_Vessel_TF = Convert_TF(Par_Vessel_TF)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
%
% Convert_TF(Par_Vessel_TF)
%
% Project:	"Marine Cybernetics Simulator: MCSim"
%
% Abstract:	Converts TF to simulation coordinate system
%			Input CS: 	Standard hydronamic, with positive x aft, positive y starboard 
%						and positive z upwards. The wave direction is defined relative
%						to the bow.
%			Output CS:	Standard marcyb, with positive x forwards, positive y starboard
%						and positive z downwards. The wave direction is defined relative
%						to the stern, in agreement with the sim CS.
%
%			The following is done:
%				- Change directions from x to pi-x
%				- Coefficient signs in surge,sway and heave are changed
%				
% Inputs:	Par_Vessel_TF			- Original structure containing transfer function data:
%			Par_Vessel_TF.Dir		- Vector of directions for which the TF is defined [rad]
%			Par_Vessel_TF.Freq		- Vector of frequencies for which the TF is defined [rad/s]
%			Par_Vessel_TF.Coefs		- Cell structure with matrixes containing amplification and phase
%								 	 for the 6 DOF. Coefs{1} is surge, Coefs{2} sway.... Coefs{6} yaw
%
% Outputs:	Par_Vessel_TF			- Updatet structure containing transfer function data:
%			Par_Vessel_TF.Dir		- Vector of directions for which the TF is defined [rad]
%			Par_Vessel_TF.Freq		- Vector of frequencies for which the TF is defined [rad/s]
%			Par_Vessel_TF.Coefs		- Cell structure with matrixes containing amplification and phase
%								 	 for the 6 DOF. Coefs{1} is surge, Coefs{2} sway.... Coefs{6} yaw
%	
% Calls:	-
%
% Author:	Øyvind Smogeli, Autumn 2001
%
% Changes:	OS, Autumn 2002: Changed structure naming for MCSim
%
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

% Directions must be changed from x to pi-x
% Coefficients must follow this new convention

% Save old TF values in temporary structure Temp
Temp = Par_Vessel_TF;

% Interchange coefficients and correct directions
% All frequencies for one direction to be moved together

% Number of frequencies and directions
nfreq	= length(Temp.Freq);
ndir	= length(Temp.Dir);

% Loop over DOF
for i = 1:6
	
	% Intialize structure
	TF.Coefs{i} = zeros(nfreq*ndir, 2);
	
	% Loop over directions
	for j = 1:ndir
		
		% Define interval for coefficients in new structure
		% All frequencies for one direction to be moved together
		start1	= (j - 1)*nfreq + 1;
		stop1	= j*nfreq;
		
		% Interval of coefficients to be moved
		start2	= (ndir - j)*nfreq + 1;
		stop2	= (ndir - j + 1)*nfreq;
		
		% Save coefs in TF structure in new order using intervals defined above
		TF.Coefs{i}(start1:stop1,:) = Temp.Coefs{i}(start2:stop2,:);
			
	end % direction loop
			
end % DOF loop

% Loop over directions
for n = 1:ndir
	
	% Change the directions to be compatible with the new coef structure
	TF.Dir(n,1) = pi - Temp.Dir(ndir - n + 1);

end % Direction loop

% Frequencies unchanged
TF.Freq = Temp.Freq;

% Change signs of amplification
TF.Coefs{1}(:,1) = -TF.Coefs{1}(:,1);	% Surge
TF.Coefs{2}(:,1) = -TF.Coefs{2}(:,1);	% Sway
TF.Coefs{3}(:,1) = -TF.Coefs{3}(:,1);	% Heave

% Return
Par_Vessel_TF = TF;
