


switch casenumber
    case 1
        loadBias = 0.01;
        loadStep =0.99;
        loadAmplitude = 0;
        loadT = 100;
        loadStepTime = 1;
        T = [-10 10];
        plotTime = [0 10];
    case 2
        loadBias = 0.5;
        loadStep =0;
        loadAmplitude = .4;
        loadT = 100;
        loadStepTime = 15;
        T = [-20 200];
        plotTime = [0 200];
    case 3
        loadBias = 0.5;
        loadStep =0;
        loadAmplitude = .4;
        loadT = .01;
        loadStepTime = 15;
        T = [-20 15];
        plotTime = [14.95 15];
    case 4
        loadBias = 0.5;
        loadStep =0;
        loadAmplitude = 0;
        loadT = .01;
        loadStepTime = 15;
        T = [-20 15];
        plotTime = [14.95 15];
end

loadfreq = 2*pi/loadT;


