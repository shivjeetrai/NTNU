% Angles of the thrusters from the bow
alpha = (pi/180)*[90,10,90,-10,90]';

% X and Y position of the thrusters
x_pos = [30, -30,27,-30,-27]';
y_pos = [0, 5,0,-5,0]';

% The transformation matrix: 3 forces on 5 thrusters
T = zeros(3,5);
for i=1:5,
    T(:,i) = [  cos(alpha(i));
                sin(alpha(i));
                x_pos(i)*sin(alpha(i))-cos(alpha(i))*y_pos(i);];
end

T_pinv = pinv(T);

save('ThrustAllocation.mat')