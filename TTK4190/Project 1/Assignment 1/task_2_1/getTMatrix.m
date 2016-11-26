function T = getTMatrix(Q)
T = [   1   sin(Q(1))*tan(Q(2))  cos(Q(1))*tan(Q(2));
        0   cos(Q(1))            -sin(Q(1));
        0   sin(Q(1))/cos(Q(2))  cos(Q(1))/cos(Q(2));
    ];
end