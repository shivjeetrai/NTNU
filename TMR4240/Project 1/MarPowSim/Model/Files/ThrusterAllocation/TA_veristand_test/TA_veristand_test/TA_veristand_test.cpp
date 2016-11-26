// TA_veristand_test.cpp : Defines the entry point for the console application.
//


#include "stdafx.h"
#include "model.h"
#include "NIVERISTAND_API.h"


int _tmain(int argc, _TCHAR* argv[])
{
	double finalTime = 10.;
	double timeStep = 0;
	long num_in = 0l;
	long num_out = 0l;
	long num_tasks = 0l;
	NIRT_InitializeModel(finalTime,&timeStep,&num_in,&num_out,&num_tasks);
	
	double outData[3*MAX_WIDTH+1] = {0.};
	double inData[6*MAX_WIDTH+4] = {0.};
	double* tau_d					= &inData[0]; ///< Desired thrust in surge, sway and. yaw [N,N,Nm]
	tau_d[0] = tau_d[1] = tau_d[2] = 0.;
	double* powerAvailableBus		= &inData[3]; ///< Power reserved for thrust at each bus [W]
	powerAvailableBus[0] = 1e10;
	double* powerAvailableThruster	= &inData[1*MAX_WIDTH+3]; ///< Power reserved for each thruster [W]
	powerAvailableThruster[0] = 1e10;
	double* switchboard2busD		= &inData[2*MAX_WIDTH+3]; ///< Mapping from switchboard index to bus index, index is switchboard index, value is bus index
	switchboard2busD[0] = 0.;
	double* nbus					= &inData[3*MAX_WIDTH+3]; ///< Number of busses
	*nbus = 1;
	double* thrusterOnD				= &inData[3*MAX_WIDTH+4]; ///< Vector of thrusters on, index is thruster index, value=1 if thruster is on 0 if thurster is off
	thrusterOnD[0] = 1.;
	double* fOld					= &inData[4*MAX_WIDTH+4]; ///< Current thrust command
	fOld[0] = 0.;
	double* alphaOld				= &inData[5*MAX_WIDTH+4]; ///< Current azimuth angles [rad]
	alphaOld[0] = 0.;
	const double* f						= &outData[0]; ///< [out] Thruster demand [-1..1]
	const double* alpha					= &outData[1*MAX_WIDTH];///< [out]  Azimuth angle of thruster [rad]
	const double* powerAllocatedThruster= &outData[2*MAX_WIDTH]; ///[out] Maximum power used by each thruster [W]
	const double* sucessfullCalculation = &outData[3*MAX_WIDTH];
	USER_TakeOneStep(inData, outData, 0.);
	NIRT_FinalizeModel();
	return 0;
}

