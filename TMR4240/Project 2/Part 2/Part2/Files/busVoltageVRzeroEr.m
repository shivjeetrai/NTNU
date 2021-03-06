function VR = busVoltageVRzeroEr(ei,p,q,zi,zr)
%BUSVOLTAGEVRZEROER
%    VR = BUSVOLTAGEVRZEROER(EI,P,Q,ZI,ZR)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    11-Jun-2014 16:55:14

VR = (sqrt(3.0).*(p.*zi-q.*zr).*(1.0./3.0))./ei;
