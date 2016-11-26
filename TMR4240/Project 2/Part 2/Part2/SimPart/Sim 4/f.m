function f_k = f(x, R_psi, M_inv, D)
f_k =[  R_psi*x(7:9);
        zeros(3,1);
        -M_inv*D*x(7:9)+M_inv*R_psi'*x(4:6)];
end