function [Coefs_new, Dirs_new] = Convert_coefs(Coefs, Dirs, Freqs)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% 
% Project:	"Marine Cybernetics Simulator: MCSim"
%
% Abstract:	Converts wavedrift, current and wind coefficients for 6 or 3 DOF.
%
% 			Input coefficients for wind, wave, current defined relative to the bow
% 			Output defined relative to vessel coordinate system
%
% 			All coefficients are changed so that direction 180 becomes 0,
% 			135 becomes 45 and 90 is unchanged (and so forth).
%
%			Sway, Roll and Yaw coefficients have their signs switched
%
%			For current and wind coefficients, Freqs should be an empty matrix []
% 
% Inputs:	Coefs		- Coefficient matrix for surge, sway and yaw, sorted by frequency and direction
%			Dirs		- Direction vector in [0 180] deg
%			Freqs		- Frequency vector, only for transfer function and wavedrift coefs
%
% Outputs:	Coefs_new	- Transformed coefficient matrix
%			Dirs_new	- Transformed direction vector
%
% Calls:	-
%						
% Author:	Oyvind Smogeli, Autumn 2002
%
% Revision:	-
%
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 


if isempty(Freqs)
	
	% Wind or current conversion, only directions
	
	ndir = length(Dirs);
	
	for count = 1:ndir
		
		Coefs_temp(ndir - count + 1,:) = Coefs(count,:);
		Dirs_temp(ndir - count + 1) = pi - Dirs(count);

	end
	
else % Wave conversion, also frequencies		
	
	%disp('NB! Assuming coefs are sorted by frequencies for each direction!!')
	
	ndir = length(Dirs);
	nfreq = length(Freqs);
	
	for count = 1:ndir
		
		% Define interval for coefficients in new structure
		% All frequencies for one direction to be moved together
		start1	= (count - 1)*nfreq + 1;
		stop1	= count*nfreq;
		
		% Interval of coefficients to be moved
		start2	= (ndir - count)*nfreq + 1;
		stop2	= (ndir - count + 1)*nfreq;
		
		% Save coefs in new order using intervals defined above
		Coefs_temp(start1:stop1,:) = Coefs(start2:stop2,:);
		
		% Swithc directions correspondingly
		Dirs_temp(ndir - count + 1) = pi - Dirs(count);
		
	end
	
	
end

% Check if input data is 3 or 6 DOF, switch signs

% 6DOF Data
if length(Coefs(1,:)) == 6

	% Switch signs
	Coefs_temp(:,2) = -Coefs_temp(:,2); % Sway
	Coefs_temp(:,4) = -Coefs_temp(:,4); % Roll
	Coefs_temp(:,6) = -Coefs_temp(:,6); % Yaw
	
% 3DOF Data: Surge, Sway, Yaw	
elseif length(Coefs(1,:)) == 3
	
	% Switch signs
	Coefs_temp(:,2) = -Coefs_temp(:,2); % Sway
	Coefs_temp(:,3) = -Coefs_temp(:,3); % Yaw
	
else
	
	disp('Input matrix different from 6 or 3 DOF, failed!')
	return
	
end
	
% Function return
Coefs_new = Coefs_temp;
Dirs_new = Dirs_temp;

return