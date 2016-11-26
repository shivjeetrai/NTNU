function Par_Vessel = Load_vessel_data(Sim_vessno)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% 
% Project:	"Marine Cybernetics Simulator: MCSim"
%
% Abstract:	Loads vessel data for the desired vessel	
% 
% Inputs:	Sim_vessno		- Vessel ID number, data to be extracted from library
%
% Outputs:	Par_Vessel		- Structure with vessel data
%
% Calls:	The vessel library script
%						
% Author:	Oyvind Smogeli, Autumn 2002
%
% Revision:	-
%
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

global Glob

switch Sim_vessno
	
	case 1 % MC_Supplyvessel_1
	
		% Call the script
		MC_Supply_1;
	case 2 % CS3
	
		% Call the script
		MC_CS3_1;
    case 3 % Drilling rig
	
		% Call the script
		MC_RIG;
        
	otherwise
	
		disp('No such vessel available')
		
end



