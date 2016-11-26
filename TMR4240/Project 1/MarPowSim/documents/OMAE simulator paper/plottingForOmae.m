function plottingForOmae()
    load logsout
    startTime = 150;
    thrusterPower = zeros(length(logsout.getElement('p').get(1).Values.Data),6);
    for i = 1:6
        thrusterPower(:,i) = logsout.getElement('p').get(i).Values.Data;
    end
    thrusterPowerTime = logsout.getElement('p').get(1).Values.Time-startTime;
    thrusterPowerSwb1 = sum(thrusterPower(:,1:2),2);
    thrusterPowerSwb23 =sum(thrusterPower(:,3:end),2);
    plot(thrusterPowerTime,thrusterPowerSwb1,thrusterPowerTime,thrusterPowerSwb23)
    
    omega1 = logsout.getElement('omega').get(1).Values.Data;
    omega23 = logsout.getElement('omega').get(4).Values.Data;
    omegaTime = logsout.getElement('omega').get(4).Values.Time-startTime;
    plot(omegaTime,omega1,omegaTime,omega23)
    
    etaHat = logsout.getElement('etaHat').Values.Data;
    etaHat(:,3) = etaHat(:,3) * 180/pi;
    etaHatTime = logsout.getElement('etaHat').Values.Time-startTime;
    plot(etaHatTime,etaHat)
    
    etaHat1 = etaHat(:,1);
    etaHat2 = etaHat(:,2);
    etaHat3 = etaHat(:,3);
    
    eta = logsout.getElement('eta').Values.Data;
    eta(:,3) = etaHat(:,3) * 180/pi;
    eta1 = eta(:,1);
    eta2 = eta(:,2);
    eta3 = eta(:,3);
    
    
    save('OMAE simulator paper/simulationData/omae','thrusterPowerTime',...
        'thrusterPowerSwb1','thrusterPowerSwb23','omega1','omega23','omegaTime',...
        'etaHat','etaHatTime','eta1','eta2','eta3','etaHat1','etaHat2','etaHat3')
    
    