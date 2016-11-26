/* Include headers */
#include "NIVERISTAND_API.h"
#include "model.h"
#include <stdlib.h>
#include <stddef.h>
#include "../../cwrapper.h"

/* User defined datatypes and constants */
#define rtDBL	0

/* Pull in the parameters structure from codegen.c */
extern Parameters rtParameter[2];
extern long READSIDE;

/* !!!! IMPORTANT !!!!
   Accessing parameters values must be done through rtParameter[READSIDE]
   The macro readParam is defined for you as a simple way to access parameters
   !!!! IMPORTANT !!!! */
#define readParam rtParameter[READSIDE]

/* INPUT: ptr, base address of where value should be set.
   INPUT: subindex, offset into ptr where value should be set.
   INPUT: value, the value to be set
   INPUT: type, the user defined type of the parameter being set, as defined in
  		  rtParamAttributes
   RETURN: status, NI_ERROR on error, NI_OK otherwise */
long USER_SetValueByDataType(void* ptr, int subindex, double value, int type)
{
	switch (type) {
	case rtDBL: 
    	((double *)ptr)[subindex] = (double)value;
    	return NI_OK;
	}
  	return NI_ERROR;
}

/* INPUT: ptr, base address of value to be retrieved.
   INPUT: subindex, offset into ptr where value should be retrieved.
   INPUT: type, the user defined type of the parameter or signal being 
  		  retrieved, as defined in rtParamAttributes or rtSignalAttributes
   RETURN: value of user-defined type cast to a double */
double USER_GetValueByDataType(void* ptr, int subindex, int type)
{
	switch (type) {
	case rtDBL:
		return (double)(((double *)ptr)[subindex]);
  	}
  	{	/* return NaN, ok for vxworks and pharlap */
	  	unsigned long nan[2] = {0xFFFFFFFF, 0xFFFFFFFF};
		return *(double*)nan;
	}
}

/*
// When a model has parameters of the form: "modelname/parameter", these model parameters are considered workspace variables in veristand
// When a model has parameters of the form: "modelname/block/paramter" these model paramters are NOT considered workspace variables in veristand
// A model should only contain either workspace variables or parameters. Never both.
typedef struct {
  int idx;			// not used
  char* paramname;	// name of the parameter, e.g., "Amplitude"
  unsigned int addr;// offset of the parameter in the Parameters struct
  int datatype;		// integer describing a user defined datatype. must have a corresponding entry in GetValueByDataType and SetValueByDataType
  int width;		// size of parameter
  int numofdims; 	// number of dimensions
  int dimListOffset;// offset into dimensions array
  int IsComplex;	// not used
} NI_Parameter;

*/

/* Define parameter attributes */
long ParameterSize DataSection(".NIVS.paramlistsize") = 14;
NI_Parameter rtParamAttribs[] DataSection(".NIVS.paramlist") = {
  	{ 0, "TA/nThrusters", offsetof(Parameters, nThrusterD), rtDBL, 1, 2, 0, 0},
	{ 0, "TA/nSwb", offsetof(Parameters, nSwitchboardsD), rtDBL, 1, 2, 2, 0},
	{ 0, "TA/TauMax", offsetof(Parameters, TauMaxD), rtDBL, MAX_WIDTH, 2, 4, 0},
	{ 0, "TA/Kt2p", offsetof(Parameters, Kt2pD), rtDBL, MAX_WIDTH, 2, 6, 0},
	{ 0, "TA/thruster2switchboard", offsetof(Parameters, thruster2switchboardD), rtDBL, MAX_WIDTH, 2, 8, 0},
	{ 0, "TA/xPosition", offsetof(Parameters, xPosition), rtDBL, MAX_WIDTH, 2, 10, 0},
	{ 0, "TA/yPosition", offsetof(Parameters, yPosition), rtDBL, MAX_WIDTH, 2, 12, 0},
	{ 0, "TA/fRampTime", offsetof(Parameters, fRampTime), rtDBL, MAX_WIDTH, 2, 14, 0},
	{ 0, "TA/turnTime", offsetof(Parameters, turnTime), rtDBL, MAX_WIDTH, 2, 16, 0},
	{ 0, "TA/fMin", offsetof(Parameters, fMin), rtDBL, MAX_WIDTH, 2, 18, 0},
	{ 0, "TA/rotable", offsetof(Parameters, rotableD), rtDBL, MAX_WIDTH, 2, 20, 0},
	{ 0, "TA/reverseThrustPowerGain", offsetof(Parameters, reverseThrustPowerGain), rtDBL, MAX_WIDTH, 2, 21, 0},
	{ 0, "TA/singularityCostGain", offsetof(Parameters, singularityCostGain), rtDBL, 1, 2, 24, 0},
	{ 0, "TA/singularityCostSmoother", offsetof(Parameters, singularityCostSmoother), rtDBL, 1, 2, 26, 0},
	
};
long ParamDimList[] DataSection(".NIVS.paramdimlist") =
{
  1, 1,  	//  nThrusterD;
  1, 1,	//  nSwitchboardsD;
  1, MAX_WIDTH,	//  TauMaxD;
  1, MAX_WIDTH,	//  Kt2pD;
  1, MAX_WIDTH,	//  thruster2switchboardD[MAX_WIDTH];
  1, MAX_WIDTH,	//  xPosition[MAX_WIDTH];
  1, MAX_WIDTH,	//  yPosition[MAX_WIDTH];
  1, MAX_WIDTH,	//  fRampTime[MAX_WIDTH]; 
  1, MAX_WIDTH,	//  turnTime[MAX_WIDTH];
  1, MAX_WIDTH,	//  fMin[MAX_WIDTH];
  1, MAX_WIDTH,	//  rotableD[MAX_WIDTH];
  1, MAX_WIDTH,	//  reverseThrustPowerGain[MAX_WIDTH];
  1, 1,	//  singularityCostGain;
  1, 1,	//  singularityCostSmoother;   
};

/* Initiatlize parameters */
Parameters initParams DataSection(".NIVS.defaultparams") = {6.,//  nThrusterD;
	3.,//  nSwitchboardsD;
{5.0627e+05, 5.0627e+05, 5.0627e+05, 5.0627e+05, 5.0627e+05, 5.0627e+05}, //  TauMaxD;
{0.0109, 0.0109, 0.0109, 0.0109, 0.0109, 0.0109},	//  Kt2pD;
{0.,0.,1.,1.,2.,2.},//  thruster2switchboardD[MAX_WIDTH];
{-35.,-35.,0.,0.,35.,35.},//  xPosition[MAX_WIDTH];
{-27,27,-27,27,-27,27},//  yPosition[MAX_WIDTH];
{5.,5.,5.,5.,5.,5.},//  fRampTime[MAX_WIDTH];
{60.,60.,60.,60.,60.,60.},//  turnTime[MAX_WIDTH]; 
{-1.,-1.,-1.,-1.,-1.,-1.},//  fMin[MAX_WIDTH]; 
{1.,1.,1.,1.,1.,1.},//  rotableD[MAX_WIDTH]; 
{1.3694,1.3694,1.3694,1.3694,1.3694,1.3694},//  reverseThrustPowerGain[MAX_WIDTH]; 
5.,//  singularityCostGain;
1e-4};//  singularityCostSmoother;   


/*
   This data structure is used to retrieve the size, width, and datatype of the default parameters.
      
   ParamSizeWidth Parameters_sizes[] DataSection(".NIVS.defaultparamsizes") = {
    { sizeof(initParams), 0, 0},  The first element in this array uses only the first field in the typedef.  It is used to specify the size of the default parameters structure.
    { sizeof(double), 1, 0 }, Subsequent elements in the array use all 3 fields, they are: the size (num of bytes per element), the width (num of elements) (2x2 array would have 4 elements), and the datatype of each parameter
   };  */
ParamSizeWidth Parameters_sizes[] DataSection(".NIVS.defaultparamsizes") = {
  { sizeof(initParams)},
  { sizeof(double), 1, rtDBL },
  { sizeof(double), 1, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), MAX_WIDTH, rtDBL },
  { sizeof(double), 1, rtDBL },
  { sizeof(double), 1, rtDBL },
};

/* Define signal attributes */
long SignalSize DataSection(".NIVS.siglistsize") = 0;
NI_Signal rtSignalAttribs[1];
long SigDimList[1];

/*
typedef struct {
  int	idx;	// not used
  char*	name;	// name of the external IO, e.g., "In1"
  int	TID;	// = 0
  int   type; 	// Ext Input: 0, Ext Output: 1
  int  width; 	// not used
  int	dimX;	// 1st dimension size
  int	dimY; 	// 2nd dimension size
} NI_ExternalIO;
*/


/* Define IO attributes */
long ExtIOSize DataSection(".NIVS.extlistsize") = 12;
long InportSize = 8;
long OutportSize = 4;
NI_ExternalIO rtIOAttribs[] DataSection(".NIVS.extlist") = {
	{ 0, "tau_d",					0, 0, 3, 1, 3},
	{ 0, "powerAvailableBus",		0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "powerAvailableThruster",	0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "switchboard2bus",			0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "nbus",					0, 0, 1, 1, 1},
	{ 0, "thrusterOn",				0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "fOld",					0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "alphaOld",				0, 0, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "f",						0, 1, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "alpha",					0, 1, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "powerAllocatedThruster",	0, 1, MAX_WIDTH, 1, MAX_WIDTH},
	{ 0, "sucessfull calculation",  0, 1, 1, 1, 1},
	{ -1 },
};

/* Model name and build information */
char * ModelName DataSection(".NIVS.compiledmodelname") = "ThrusterAllocation";
char * build DataSection(".NIVS.builder") = "VeriStand 2.0 Custom DLL";

/* baserate is the rate at which the model runs */
double baserate = 1;

/*
typedef struct {
  int    tid;		// = 0
  double tstep;		
  double offset;
  int priority;
} NI_Task;
*/

NI_Task rtTaskAttribs DataSection(".NIVS.tasklist") = { 0 /* must be 0 */, .01 /* must be equal to baserate */, 0, 0 };

void* TAobj_9up0a9joliuhasp08f7yhkljhbl1uiyg2bep7 = 0x0;
/* RETURN: status, NI_ERROR on error, NI_OK otherwise */
long USER_Initialize() {
	
	unsigned int nSwitchboards = (unsigned int) readParam.nSwitchboardsD;
	unsigned int nThruster = (unsigned int) readParam.nThrusterD;
	double* TauMax = readParam.TauMaxD;
	double* Kt2p = readParam.Kt2pD;
	double* xPosition = readParam.xPosition;
	double* yPosition = readParam.yPosition;
	double* fRampTime = readParam.fRampTime;
	double* turnTime =	readParam.turnTime;
	double* fMin = readParam.fMin;
	double* rotable = readParam.rotableD;
	double* reverseThrustPowerGain = readParam.reverseThrustPowerGain;
	double sampleTime = baserate;
	double singularityCostGain = readParam.singularityCostGain;
	double singularityCostSmoother = readParam.singularityCostSmoother;
	
	unsigned int thruster2switchboard[MAX_WIDTH];
	unsigned int i;

	for (i = 0; i < nThruster; i++){
		thruster2switchboard[i] = readParam.thruster2switchboardD[i];
		if (thruster2switchboard[i] < 0 || thruster2switchboard[i] >= nSwitchboards || 
			TauMax[i] <= 0 || Kt2p[i] <= 0 || fRampTime[i] <= 0 || turnTime[i] < 0 
			|| fMin[i] > 1|| reverseThrustPowerGain[i] <= 0)
			return NI_ERROR;
	}
	
	if (nSwitchboards  <= 0 || nThruster <= 0 || sampleTime <= 0 || singularityCostGain < 0 || singularityCostSmoother < 0 )
		return NI_ERROR;


	TAobj_9up0a9joliuhasp08f7yhkljhbl1uiyg2bep7 = thrusterAllocationInit(nThruster,nSwitchboards,TauMax,Kt2p,thruster2switchboard,xPosition,yPosition,fRampTime,turnTime,fMin,rotable,reverseThrustPowerGain,sampleTime,singularityCostGain,singularityCostSmoother);
	return NI_OK;
}

/* INPUT: *inData, pointer to inport data at the current timestamp, to be 
  	      consumed by the function
   OUTPUT: *outData, pointer to outport data at current time + baserate, to be
  	       produced by the function
   INPUT: timestamp, current simulation time */
DLL_EXPORT void USER_TakeOneStep(double *inData, double *outData, double timestamp) 
{	
	double* sucessfullCalculation   = &outData[3*MAX_WIDTH];
	if (outData && TAobj_9up0a9joliuhasp08f7yhkljhbl1uiyg2bep7 != 0){
		const double* tau_d					= &inData[0]; ///< Desired thrust in surge, sway and. yaw [N,N,Nm]
		const double* powerAvailableBus		= &inData[3]; ///< Power reserved for thrust at each bus [W]
		const double* powerAvailableThruster= &inData[1*MAX_WIDTH+3]; ///< Power reserved for each thruster [W]
		const double* switchboard2busD		= &inData[2*MAX_WIDTH+3]; ///< Mapping from switchboard index to bus index, index is switchboard index, value is bus index
		const unsigned int nbus				= (unsigned int)  inData[3*MAX_WIDTH+3]; ///< Number of busses
		const double* thrusterOnD			= &inData[3*MAX_WIDTH+4]; ///< Vector of thrusters on, index is thruster index, value=1 if thruster is on 0 if thurster is off
		const double* fOld					= &inData[4*MAX_WIDTH+4]; ///< Current thrust command
		const double* alphaOld				= &inData[5*MAX_WIDTH+4]; ///< Current azimuth angles [rad]
		double* f						= &outData[0]; ///< [out] Thruster demand [-1..1]
		double* alpha					= &outData[1*MAX_WIDTH];///< [out]  Azimuth angle of thruster [rad]
		double* powerAllocatedThruster  = &outData[2*MAX_WIDTH]; ///[out] Maximum power used by each thruster [W]
		
		
		unsigned int switchboard2bus[MAX_WIDTH];
		unsigned int i;

		if (nbus <= 0){
				*sucessfullCalculation = 0;
				return;
			}


		for ( i = 0; i < readParam.nSwitchboardsD; i++){
			switchboard2bus[i] = switchboard2busD[i];
			if(switchboard2bus[i] < 0 || switchboard2bus[i] >= nbus){
				*sucessfullCalculation = 0;
				return;
			}
		}

		*sucessfullCalculation = thrusterAllocation(TAobj_9up0a9joliuhasp08f7yhkljhbl1uiyg2bep7,tau_d,powerAvailableBus,powerAvailableThruster,switchboard2bus,nbus,thrusterOnD,fOld,alphaOld,f,alpha,powerAllocatedThruster);
		
	} else {
		*sucessfullCalculation = 0;
	}
	
}

/* RETURN: status, NI_ERROR on error, NI_OK otherwise */
long USER_Finalize() {
	thrusterAllocationTerminate(TAobj_9up0a9joliuhasp08f7yhkljhbl1uiyg2bep7);
	return NI_OK;
}
