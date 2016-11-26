%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% MC_Supply_1.m 
%
% Project:	"Marine Cybernetics Simulator: MCSim"
%
% Abstract:	Vessel data for MarCyb Vessel 1: Supply vessel		
% 
% Inputs:	- 
%
% Outputs:	-
%
% Calls:	Convert_coefs		- Convert LF data to simulation coordinate system
%			Convert_TF			- Convert TF data to simulation coordinate system
%			MC_Supply_1_TF		- Script with TF data
%						
% Author:	Oyvind Smogeli, Autumn 2002
%
% Revision:	-
%
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

%-----------------------------------------------------------------------------------------
% Vessel description
%-----------------------------------------------------------------------------------------
Par_Vessel.name			= 'Supply vessel, Lpp 80m, B 17.4m, T 5.6 m';


%-----------------------------------------------------------------------------------------
% Main particulars
%-----------------------------------------------------------------------------------------

Par_Vessel.l			= 80; 				% lpp (m)
Par_Vessel.b			= 17.4;				% breadth (m)
Par_Vessel.t			= 5.6;				% draft (m)
Par_Vessel.dpl			= 6000;				% displacement (m^3)
Par_Vessel.gmt			= 3.2;				% transverse metacentric height (m)
Par_Vessel.gml 			= 70;				% longship metacentric height (m)
Par_Vessel.awp			= 1400;				% waterplane area (m^2)
Par_Vessel.rgyr_x		= 22;				% radius of gyration, roll (m)
Par_Vessel.rgyr_y		= 6.1;				% radius of gyration, pitch (m)
Par_Vessel.rgyr_z		= 16.3;				% radius of gyration, yaw (m)
Par_Vessel.wind_area_x 	= 330;				% projected wind force area, surge (m^2)
Par_Vessel.wind_area_y 	= 720;				% projected wind force area, sway (m^2)
Par_Vessel.curr_area_x 	= 100;				% projected current force area, surge (m^2)
Par_Vessel.curr_area_y 	= 430;				% projected current force area, sway (m^2)

Par_Vessel.wd_arm_x		= Par_Vessel.t/2;	% arm for estimating pitch wavedrift from surge (m)
Par_Vessel.wd_arm_y		= Par_Vessel.t/2;	% arm for estimating roll wavedrift from sway (m)

Par_Vessel.curr_arm_x	= Par_Vessel.t/2;	% arm for estimating pitch current response from surge (m)
Par_Vessel.curr_arm_y	= Par_Vessel.t/2;	% arm for estimating roll current response from sway (m)

% This is a rough estimate, we should know the exact superstructure area distribution
Par_Vessel.wind_arm_x	= Par_Vessel.wind_area_x/Par_Vessel.b/2;	% arm for estimating pitch wind response from surge (m)
Par_Vessel.wind_arm_y	= Par_Vessel.wind_area_y/Par_Vessel.l/2;	% arm for estimating roll wind response from sway (m)

Par_Vessel.mass			= Par_Vessel.dpl*Glob.rhow;		% dry mass (kg)

%-----------------------------------------------------------------------------------------
% Coordinates
%-----------------------------------------------------------------------------------------
% All vectors defined with respect to the hydrodynamic center coh, which is defined in:
% Ship:		At lpp/2 and in the waterplane
% Platform:	?

Par_Vessel.r_cg 		= [-2.3 0 -5.2];	% vector from coh to center of gravity
Par_Vessel.r_cb 		= [-2.3 0 -3.0];	% vector from coh to center of bouyancy
Par_Vessel.r_ca 		= [0 0 0];			% vector from coh to center of added mass
Par_Vessel.r_cd 		= [-2.3 0 -5.2];	% vector from coh to center of damping

Par_Vessel.r_current	= [-2.3 0 -5.6];	% coordinates in which current data are specified
Par_Vessel.r_wind		= [-2.3 0 -5.6];	% coordinates in which wind data are specified
Par_Vessel.r_wavedrift	= [-2.3 0 -5.6];	% coordinates in which wavedrift data are specified
Par_Vessel.r_TF			= [0 0 0];			% coordinates in which transfer function data are specified

%-----------------------------------------------------------------------------------------
% Rigid-body inertia matrix
%-----------------------------------------------------------------------------------------

% Rigid-body mass
m0		= Par_Vessel.mass;

% Moments of inertia
i_x		= Par_Vessel.mass*Par_Vessel.rgyr_x^2;     
i_y		= Par_Vessel.mass*Par_Vessel.rgyr_y^2;     
i_z		= Par_Vessel.mass*Par_Vessel.rgyr_z^2;     
i_xy	= 0;                                
i_xz 	= 0;
i_yz 	= 0;

I0 = [ ...
	 i_x  -i_xy -i_xz
	-i_xz  i_y  -i_yz
	-i_xz -i_yz  i_z ];
        
% Inertia matrix about CG 
Par_Vessel.M_rb_CG = [...
	m0*eye(3,3)	, zeros(3,3);
	zeros(3,3)	, I0		];
	
% Transformed to COH	
Par_Vessel.M_rb = Hmtrx(Par_Vessel.r_cg)'*Par_Vessel.M_rb_CG*Hmtrx(Par_Vessel.r_cg);
	

%-----------------------------------------------------------------------------------------
% Added mass matrix
%-----------------------------------------------------------------------------------------

% About CA
Par_Vessel.M_a_CA = [...
  5.3420e+005            0 -3.5890e+005            0 -7.1007e+007            0
            0  5.1828e+006            0  1.1346e+007            0  9.5281e+005
 -3.6047e+005            0  1.9926e+007            0  1.9683e+008            0
            0  1.1276e+007            0  2.6167e+008            0 -1.9025e+008
 -7.0701e+007            0  1.9664e+008            0  1.7770e+010            0
            0  9.5281e+005            0 -1.9082e+008            0  1.5266e+009 ];

% Transformed to COH	
Par_Vessel.M_a = Hmtrx(Par_Vessel.r_ca)'*Par_Vessel.M_a_CA*Hmtrx(Par_Vessel.r_ca);
		
%-----------------------------------------------------------------------------------------
% Generalized inertia matrix M 
%-----------------------------------------------------------------------------------------
		
% Add M and M0 and A0 in COH
Par_Vessel.M = Par_Vessel.M_rb + Par_Vessel.M_a;
	
% Inverted
Par_Vessel.M_inv = inv(Par_Vessel.M);


%-----------------------------------------------------------------------------------------
% Coriolis-Centrifugal matrices
%-----------------------------------------------------------------------------------------

% These are nonlinear, and must be calculated online by the gnc function m2c:

% C_rb	= m2c(Par_Vessel.M_rb, Nu)
% C_a 	= m2c(Par_Vessel.M_a, Nu_r) 

% Nu_r is the relative velocity vector, included current


%-----------------------------------------------------------------------------------------
% Linear restoring matrix with respect to CG and COH
%-----------------------------------------------------------------------------------------

g33 = Glob.rhow*Glob.g*Par_Vessel.awp; 					% Heave restoring due to heave motion
g44 = Glob.rhow*Glob.g*Par_Vessel.dpl*Par_Vessel.gmt; 	% Roll restoring due to roll motion
g55 = Glob.rhow*Glob.g*Par_Vessel.dpl*Par_Vessel.gml; 	% Pitch restoring due to pitch motion
g35 = 0;												% Heave restoring due to pitch motion
g53 = g35;												% Pitch restoring due to heave motion

Par_Vessel.G_CB      	= zeros(6,6);
Par_Vessel.G_CB(3,3)	= g33;
Par_Vessel.G_CB(4,4)	= g44;
Par_Vessel.G_CB(5,5)	= g55;
Par_Vessel.G_CB(3,5)	= g35;
Par_Vessel.G_CB(5,3)	= g53;
		
% Transform to COH 
Par_Vessel.G = Hmtrx(Par_Vessel.r_cb)'*Par_Vessel.G_CB*Hmtrx(Par_Vessel.r_cb);

%-----------------------------------------------------------------------------------------
% Linear damping with respect to COH 
%-----------------------------------------------------------------------------------------

Par_Vessel.DL_CD = [...
2.2210e+005            0            0            0            0            0
          0  2.8280e+005            0            0            0            0
          0            0  3.8725e+006            0            0            0
          0            0            0  1.6035e+008            0            0
          0            0            0            0  1.6265e+009            0
          0            0            0            0            0  8.1620e+007 ];

% Transform to COH 
Par_Vessel.DL = Hmtrx(Par_Vessel.r_cd)'*Par_Vessel.DL_CD*Hmtrx(Par_Vessel.r_cd);
		
% Time constants for linear damping
Par_Vessel.T_surge = 40;
Par_Vessel.T_sway = 80;
Par_Vessel.T_yaw = 50;

% Linear damping from time constants and generalized mass
d11 = Par_Vessel.M(1,1)/Par_Vessel.T_surge;
d22 = Par_Vessel.M(2,2)/Par_Vessel.T_sway;
d66 = Par_Vessel.M(6,6)/Par_Vessel.T_yaw;

% Substitute with the time constant values.
% Check => Of the same order of magnitude, OK
Par_Vessel.DL(1,1)	= d11;
Par_Vessel.DL(2,2)	= d22;
Par_Vessel.DL(6,6)	= d66;


%-----------------------------------------------------------------------------------------
% Nonlinear damping with respect to COH 
%-----------------------------------------------------------------------------------------

% Only terms in heave, roll and pitch. To be used in addition to current coefficients, to
% get nonlinear damping in these DOF?
% NOT IMPLEMENTED AS OF YET
Par_Vessel.DNL_CD = [...
0            0            0            0            0            0
0            0            0            0            0            0
0            0  3.8725e+007            0            0            0
0            0            0  1.6035e+010            0            0
0            0            0            0  1.6265e+011            0
0            0            0            0            0            0 ];

% Transform to COH 
Par_Vessel.DNL = Hmtrx(Par_Vessel.r_cd)'*Par_Vessel.DNL_CD*Hmtrx(Par_Vessel.r_cd);


%-----------------------------------------------------------------------------------------
% Current data
%-----------------------------------------------------------------------------------------

% Directions for the current coefficients (deg)
Par_Vessel.Current.Dirs = (0:10:180)*pi/180;

% Current force coefficients for each direction 
% Surge Sway Yaw
Par_Vessel.Current.Coefs = [...
 -9.2319e+003            0            0
 -9.4279e+003 -1.9898e+004 -2.4918e+005
 -1.0410e+004 -4.2066e+004 -5.1847e+005
 -1.2376e+004 -6.8636e+004 -7.5088e+005
 -1.4537e+004 -9.7417e+004 -9.4749e+005
 -1.4339e+004 -1.2630e+005 -9.4749e+005
 -1.1982e+004 -1.5057e+005 -6.0786e+005
 -8.8391e+003 -1.6606e+005 -5.1828e+005
 -5.1076e+003 -1.7485e+005 -2.1429e+005
 -1.3748e+003 -1.7930e+005  1.0714e+005
  3.1430e+003 -1.7492e+005  5.0084e+005
  7.2683e+003 -1.6405e+005  8.5840e+005
  1.1000e+004 -1.4607e+005  1.1799e+006
  1.4339e+004 -1.2171e+005  1.4477e+006
  1.6304e+004 -9.5206e+004  1.5013e+006
  1.6304e+004 -7.0808e+004  1.2709e+006
  1.5322e+004 -4.6496e+004  9.4749e+005
  1.3751e+004 -2.4354e+004  5.7185e+005
  1.1786e+004            0            0 ];

% Convert from directions relative to the bow to directions relative to body coordinates
[Par_Vessel.Current.Coefs, Par_Vessel.Current.Dirs] = ...
	Convert_coefs(Par_Vessel.Current.Coefs, Par_Vessel.Current.Dirs,[]);

% Change to 6DOF
Temp = zeros(length(Par_Vessel.Current.Coefs(:,1)),6); 
Temp(:,1:2) = Par_Vessel.Current.Coefs(:,1:2); 
Temp(:,6) = Par_Vessel.Current.Coefs(:,3); 

% Add data for roll and pitch, calculated from sway and surge
Temp(:,4) = -Temp(:,2)*Par_Vessel.curr_arm_y;
Temp(:,5) =	Temp(:,1)*Par_Vessel.curr_arm_x;

Par_Vessel.Current.Coefs = Temp;

%-----------------------------------------------------------------------------------------
% Wind data
%-----------------------------------------------------------------------------------------

% Directions for the wind coefficients (deg)
Par_Vessel.Wind.Dirs = (0:10:180)'*pi/180;

% Wind force coefficients for each direction
% Surge Sway Yaw
Par_Vessel.Wind.Coefs = [...
 -2.0822e+002            0            0
 -1.8153e+002 -5.6270e+001 -1.9056e+003
 -1.9651e+002 -1.2471e+002 -3.7588e+003
 -2.0199e+002 -2.0064e+002 -6.1901e+003
 -2.0663e+002 -2.7693e+002 -6.7515e+003
 -1.6935e+002 -3.9326e+002 -6.8052e+003
 -1.0850e+002 -4.0866e+002 -6.5428e+003
 -6.1281e+001 -3.9376e+002 -5.9219e+003
 -2.4879e+001 -3.8663e+002 -4.7695e+003
 -3.7230e+000 -3.9001e+002 -4.6104e+003
  3.0412e-001 -3.7650e+002 -3.5119e+003
  1.6477e+001 -3.7296e+002 -2.3763e+003
  4.1364e+001 -3.9610e+002 -1.1683e+003
  9.6800e+001 -3.8050e+002  2.3578e+001
  1.3436e+002 -3.1942e+002 -2.1251e+002
  1.4903e+002 -2.3876e+002 -4.5137e+002
  2.2413e+002 -1.3622e+002 -6.6156e+002
  2.6519e+002 -6.1332e+001 -5.5110e+002
  2.4837e+002            0            0 ];


% Convert from directions relative to the bow to directions relative to body coordinates
[Par_Vessel.Wind.Coefs, Par_Vessel.Wind.Dirs] = ...
	Convert_coefs(Par_Vessel.Wind.Coefs, Par_Vessel.Wind.Dirs,[]);

% Change to 6DOF
Temp = zeros(length(Par_Vessel.Wind.Coefs(:,1)),6); 
Temp(:,1:2) = Par_Vessel.Wind.Coefs(:,1:2); 
Temp(:,6) = Par_Vessel.Wind.Coefs(:,3); 

% Add data for roll and pitch, calculated from sway and surge
Temp(:,4) = Temp(:,2)*Par_Vessel.wind_arm_y;
Temp(:,5) =	-Temp(:,1)*Par_Vessel.wind_arm_x;

Par_Vessel.Wind.Coefs = Temp;


%-----------------------------------------------------------------------------------------
% Wave drift data
%-----------------------------------------------------------------------------------------

% Directions for the wave drift coefficients (deg)
Par_Vessel.Wavedrift.Dirs = [...
	0
	45
	90
	135
	180 ]*pi/180;

% Frequencies for the wave drift coefficients (rad/s)
Par_Vessel.Wavedrift.Freqs = [...
	0
	0.3142
	0.4189
	0.5236
	0.6283
	0.6981
	0.7854
	0.8378
	0.8976
	0.9666
	1.0470
	1.1420
	1.2570
	1.7950 ];

% Wave drift coefficients, sorted first by frequency then direction
Par_Vessel.Wavedrift.Coefs = [...
	-1.9547e+001            0            0
	-1.9547e+001            0            0
	-5.3496e+001            0            0
	-1.4814e+002            0            0
	-4.3209e+002            0            0
	-1.0308e+003            0            0
	-5.3733e+003            0            0
	-1.4737e+004            0            0
	-3.5870e+004            0            0
	-6.3952e+004            0            0
	-7.2259e+004            0            0
	-5.5887e+004            0            0
	-4.6345e+004            0            0
	-2.1714e+004            0            0
	-7.2014e+000 -7.2019e+000  5.0464e+003
	-7.2014e+000 -7.2019e+000  5.0464e+003
	-6.1727e+000 -6.1730e+000  1.9131e+004
	7.5101e+001  7.6134e+001  9.2101e+003
	-2.3970e+002 -3.0145e+002  2.1327e+005
	-2.3148e+002 -4.2182e+002  1.8575e+005
	-1.3117e+003 -1.6914e+003  8.2454e+004
	-4.8630e+003 -4.8294e+003 -8.8329e+004
	-1.6591e+004 -1.5005e+004 -4.8027e+005
	-4.4189e+004 -4.3138e+004 -1.2357e+006
	-7.8883e+004 -9.5951e+004 -1.9188e+006
	-9.0452e+004 -1.5914e+005 -1.7962e+006
	-7.2005e+004 -2.0988e+005 -1.1557e+006
	-3.2407e+004 -2.3495e+005 -1.2093e+006
	0            0            0
	0            0            0
	0            0 -3.0865e+000
	0 -1.0289e+000  6.1730e+000
	0 -4.2594e+002  5.7338e+003
	0 -1.2696e+003  7.9334e+003
	-1.6460e+001 -6.2009e+003  1.2943e+004
	-1.1111e+002 -1.5852e+004  5.3952e+003
	-6.9134e+002 -4.4931e+004 -5.4671e+004
	-3.6007e+003 -1.3262e+005 -2.9866e+005
	-1.1706e+004 -2.9417e+005 -6.9068e+005
	-1.9061e+004 -3.5811e+005 -4.6145e+005
	-2.0429e+004 -3.5291e+005 -2.1982e+004
	-2.1447e+004 -3.7652e+005 -7.3231e+004
	-7.2014e+000  7.2019e+000 -5.0464e+003
	-7.2014e+000  7.2019e+000 -5.0464e+003
	-6.1727e+000  6.1730e+000 -1.9131e+004
	8.4360e+001 -8.2307e+001 -9.0013e+003
	-8.1273e+001  1.9548e+001 -2.1127e+005
	1.0802e+002 -2.9219e+002 -1.8504e+005
	1.4835e+003 -1.7645e+003 -1.0056e+005
	5.4237e+003 -4.9374e+003  1.7649e+004
	1.8275e+004 -1.4473e+004  2.3850e+005
	4.9299e+004 -3.8572e+004  5.5041e+005
	8.8622e+004 -7.9772e+004  8.1841e+005
	9.5537e+004 -1.2244e+005  1.0677e+006
	6.4800e+004 -1.4945e+005  7.2903e+005
	5.2073e+004 -1.6507e+005  5.8334e+005
	-1.9547e+001            0            0
	-1.9547e+001            0            0
	-5.3496e+001            0            0
	-1.3579e+002            0            0
	-3.8785e+002            0  3.0865e+000
	-6.5121e+002            0  1.0289e+000
	1.5905e+003            0 -3.0865e+000
	9.1231e+003            0 -7.2019e+000
	2.8217e+004            0 -1.2346e+001
	5.5596e+004            0 -1.7490e+001
	7.1703e+004  1.0289e+000 -1.8519e+001
	8.3401e+004  1.0289e+000 -1.4404e+001
	9.9432e+004  1.0289e+000 -1.5433e+001
	8.7518e+004            0 -1.1317e+001 ];


% Convert from directions relative to the bow to directions relative to body coordinates
[Par_Vessel.Wavedrift.Coefs, Par_Vessel.Wavedrift.Dirs] = ...
	Convert_coefs(Par_Vessel.Wavedrift.Coefs, Par_Vessel.Wavedrift.Dirs, Par_Vessel.Wavedrift.Freqs);

% Change to 6DOF
Temp = zeros(length(Par_Vessel.Wavedrift.Coefs(:,1)),6); 
Temp(:,1:2) = Par_Vessel.Wavedrift.Coefs(:,1:2); 
Temp(:,6) = Par_Vessel.Wavedrift.Coefs(:,3); 

% Add data for roll and pitch, calculated from sway and surge
Temp(:,4) = -Temp(:,2)*Par_Vessel.wd_arm_y;
Temp(:,5) =	Temp(:,1)*Par_Vessel.wd_arm_x;

Par_Vessel.Wavedrift.Coefs = Temp;

% Convert to format for use in Simulink interpolation tables
nfreq = length(Par_Vessel.Wavedrift.Freqs);
ndir = length(Par_Vessel.Wavedrift.Dirs);

% Loop over DOF
for k = 1:6

	Ampvec = Par_Vessel.Wavedrift.Coefs(:,k);

	for n = 1:ndir
		
		Amp(:,n) = Ampvec((n-1)*nfreq + 1:n*nfreq);
		
	end

	Par_Vessel.Wavedrift.Amp(:,:,k) = Amp;
	
end % DOF loop



%-----------------------------------------------------------------------------------------
% Transfer function data
%-----------------------------------------------------------------------------------------

% Read input matrixes from script
% Coefficients on the format:
% Direction		Frequency		Amplitude	Phase
MC_Supply_1_TF;

% Save only relevant parameters: amplitude and phase
% Convert directions to radians
Par_Vessel.TF.Dir		= Dir_TF(:,2)*pi/180;
Par_Vessel.TF.Freq		= Freq_TF(:,2);
Par_Vessel.TF.Coefs{1}	= Surge_TF_Coefs(:,3:4);
Par_Vessel.TF.Coefs{2}	= Sway_TF_Coefs(:,3:4);
Par_Vessel.TF.Coefs{3}	= Heave_TF_Coefs(:,3:4);
Par_Vessel.TF.Coefs{4}	= Roll_TF_Coefs(:,3:4);
Par_Vessel.TF.Coefs{5}	= Pitch_TF_Coefs(:,3:4);
Par_Vessel.TF.Coefs{6}	= Yaw_TF_Coefs(:,3:4);

% Convert phase to radians
for i = 1:6
	
	Par_Vessel.TF.Coefs{i}(:,2) = Par_Vessel.TF.Coefs{i}(:,2)*pi/180;
	
end

% Convert transfer function to simulation CS
Par_Vessel.TF = Convert_TF(Par_Vessel.TF);	

% Convert to format for use in Simulink interpolation tables
nfreq = length(Par_Vessel.TF.Freq);
ndir = length(Par_Vessel.TF.Dir);

% Loop over DOF
for k = 1:6
    
	Ampvec = Par_Vessel.TF.Coefs{k}(:,1);
	Phasevec = Par_Vessel.TF.Coefs{k}(:,2);
 
	for n = 1:ndir
		
		Amp_M(:,n) = Ampvec((n-1)*nfreq + 1:n*nfreq);
		Phase_M(:,n) = Phasevec((n-1)*nfreq + 1:n*nfreq);
		
	end

	Par_Vessel.TF.Amp_M(:,:,k) = Amp_M;
	Par_Vessel.TF.Phase_M(:,:,k) = Phase_M;
	
end % DOF loop



%	Explanation:
%
%	Par_Vessel.TF		- Structure containing transfer function data:
%	Par_Vessel.TF.Dir	- Vector of directions for which the TF is defined [rad]
%	Par_Vessel.TF.Freq	- Vector of frequencies for which the TF is defined [rad/s]
%	Par_Vessel.TF.Coefs	- Cell structure with matrixes containing amplification and phase
%						  for the 6 DOF. Coefs{1} is surge, Coefs{2} sway.... Coefs{6} yaw
	