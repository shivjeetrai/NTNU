
init
sim PMStest


sum(powerAvailableHP.Data(1,:) ~= HighPriorityDesiredPower)
sum(powerAvailableDP.Data(1,:) ~= DPDesiredPower)
sum(powerAvailableLP.Data(1,:) ~= LowPriorityDesiredPower)
