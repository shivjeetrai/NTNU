function T = getTQuatMatrix(eta, epsilon)
T = [   -epsilon(1)     -epsilon(2)  -epsilon(3);
        eta             -epsilon(3)  epsilon(2);
        epsilon(3)      eta          -epsilon(1);
        -epsilon(2)     epsilon(1)   eta];
end