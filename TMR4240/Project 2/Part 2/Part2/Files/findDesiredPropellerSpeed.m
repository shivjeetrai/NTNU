% omega_d = findDesiredPropellerSpeed(Td,thruster,rho)
%
% Finds desired propellerspeed from desired thrust.
% Assumes constant KT0 (sec 3.5. in Smogeli2006)
%
% Inputs:
%    Td  -  Desired thrust [N]
%    thruster - Struct of propeller properties
%    rho -  Density of fluid
%
% Output:
%    omega_d - angular velocity of propeller which makes the propeller
%    generate the desired thrust [rad/s]
%
%    Copyright: 	NTNU, Trondheim, Norway
%    Created:  	2014.07.02	Torstein Ingebrigtsen B?
%    Revised:	<date>	<author> <description>
%    		<date>	<author> <description>
%

function omega_d = findDesiredPropellerSpeed(Td,thruster,rho)


if (Td >= 0)
    omega_d = 2*pi*sqrt(Td/(rho*(2*thruster.radius)^4*thruster.KT0));
else
    omega_d = -2*pi*sqrt(-Td/(rho*(2*thruster.radius)^4*thruster.KT0r));
end