function [Jac]=J(psi,b1,b2,u,v, M_inverse, D)

temp=-M_inverse*D;
k1=temp(1,1);
k2=temp(2,2);
k3=temp(3,3);

j1=M_inverse(1,1);
j2=M_inverse(2,2);
j3=M_inverse(3,3);

Jac=zeros(9);

Jac(1,3)=-sin(psi)*u-cos(psi)*v;
Jac(1,7)=cos(psi);
Jac(1,8)=-sin(psi);

Jac(2,3)=cos(psi)*u-sin(psi)*v;
Jac(2,7)=sin(psi);
Jac(2,8)=cos(psi);

Jac(3,9)=1;

Jac(7,3)=-j1*sin(psi)*b1+j2*cos(psi)*b2;
Jac(7,4)=j1*cos(psi);
Jac(7,5)=j2*sin(psi);
Jac(7,7)=k1;

Jac(8,3)=-j1*cos(psi)*b1-j2*sin(psi)*b2;
Jac(8,4)=-j1*sin(psi);
Jac(8,5)=j2*cos(psi);


Jac(8,8)=k2;

Jac(9,6)=j3;
Jac(9,9)=k3;
end