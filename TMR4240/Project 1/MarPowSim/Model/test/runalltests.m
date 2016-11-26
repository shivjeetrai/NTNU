% runalltests()
%
% Run all unit tests in matlab
%
%
%    Copyright: 	NTNU, Trondheim, Norway
%    Created:  	2014.07.02	Torstein Ingebrigtsen B?
%    Revised:	<date>	<author> <description>
%               <date>	<author> <description>
%

run(theveninEquivalentTest);
run(testBusVoltage);
addpath('thruster');
run(thrusterTestCase)