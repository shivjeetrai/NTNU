The simulations (slx files) for each task are saved in the folder PlotsPart, since they were changed in each simulation task.

To run the files we included a script that runs the files, but the script only runs the same slx file saved in the original place.

Thus (after opened the folder Project 1 -> MarPowSim -> Part 1: 

1) Run initProject1.m
2) Run controlGainsDP.m
3) "Open the desired slx file and run it"
4) Run plotF.m 


Note: The unfiltered reference set points in simulation 4 was done by moving the reference-workspace block to the reference model before the transfer
functions and then modify the plotF script to only plot the reference and not actual. We are extremely sorry for this inconvinence, but we didn't know
that the simulation should account for all graphs (even though it made sense). However in the pdf the reference model for each of the simulation is given 
such that if you choose to modify the slx file from one simulation to another, it will be possible.