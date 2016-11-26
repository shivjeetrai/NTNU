#ifndef MODEL_h
# define MODEL_h 

#define MAX_WIDTH 100
typedef struct {                           
  	double nThrusterD;
	double nSwitchboardsD;
	double TauMaxD[MAX_WIDTH];
	double Kt2pD[MAX_WIDTH];
	double thruster2switchboardD[MAX_WIDTH];
	double xPosition[MAX_WIDTH];
	double yPosition[MAX_WIDTH];
	double fRampTime[MAX_WIDTH]; 
	double turnTime[MAX_WIDTH];
	double fMin[MAX_WIDTH];
	double rotableD[MAX_WIDTH];
	double reverseThrustPowerGain[MAX_WIDTH];
	double singularityCostGain;
	double singularityCostSmoother;                             
} Parameters;
#endif
