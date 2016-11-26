function [phi_r, theta_r, psi_r] = getEulerAnglesInRadians(phi_deg, theta_deg,psi_deg)
phi_r = phi_deg*(pi/180); 
theta_r = theta_deg*(pi/180);
psi_r = psi_deg*(pi/180);
end