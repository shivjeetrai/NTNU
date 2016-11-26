function [J]=Jac(psi,b1,b2,u,v, M_inverse, D)

temp=-M_inv*D;
k1=temp(1,1);
k2=temp(2,2);
k3=temp(3,3);

j1=M_inv(1,1);
j2=M_inv(2,2);
j3=M_inv(3,3);

J=zeros(9);

J(1,3)=-sin(psi)*u-cos(psi)*v;
J(1,7)=cos(psi);
J(1,8)=-sin(psi);

J(2,3)=cos(psi)*u-sin(psi)*v;
J(2,7)=sin(psi);
J(2,8)=cos(psi);

J(3,9)=1;

J(7,3)=-j1*sin(psi)*b1+j2*cos(psi)*b2;
J(7,4)=j1*cos(psi);
J(7,5)=j2*sin(psi);
J(7,7)=k1;

J(8,3)=-j1*cos(psi)*b1-j2*sin(psi)*b2;
J(8,4)=-j1*sin(psi);
J(8,5)=j2*cos(psi);


J(8,8)=k2;

J(9,6)=j3;
J(9,9)=k3;
end