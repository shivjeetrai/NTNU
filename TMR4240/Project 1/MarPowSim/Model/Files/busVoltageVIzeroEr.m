function VI = busVoltageVIzeroEr(ei,p,q,zi,zr)
%BUSVOLTAGEVIZEROER
%    VI = BUSVOLTAGEVIZEROER(EI,P,Q,ZI,ZR)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    11-Jun-2014 16:55:14

t2 = ei.^2;
t3 = 1.0./ei;
t4 = p.^2;
t5 = zi.^2;
t6 = q.^2;
t7 = zr.^2;
t8 = t2.^2;
t9 = t8.*3.0;
t10 = p.*q.*zi.*zr.*(8.0./3.0);
t11 = t9+t10-t4.*t5.*(4.0./3.0)-t6.*t7.*(4.0./3.0)-p.*t2.*zr.*4.0-q.*t2.*zi.*4.0;
t12 = sqrt(t11);
t13 = sqrt(3.0);
t14 = t2.*t13;
VI = [t3.*(t12+t14).*(1.0./2.0);t3.*(t12-t14).*(-1.0./2.0)];