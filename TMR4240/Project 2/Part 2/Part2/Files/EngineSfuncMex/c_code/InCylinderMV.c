/*
 * File: InCylinderMV.c
 *
 *
  *
  *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: 3.0 ---
  *
  *   This file is an S-function produced by the S-Function
  *   Builder which only recognizes certain fields.  Changes made
  *   outside these fields will be lost the next time the block is
  *   used to load, edit, and resave this file. This file will be overwritten
  *   by the S-function Builder block. If you want to edit this file by hand, 
  *   you must change it only in the area defined as:  
  *
  *        %%%-SFUNWIZ_defines_Changes_BEGIN
  *        #define NAME 'replacement text' 
  *        %%% SFUNWIZ_defines_Changes_END
  *
  *   DO NOT change NAME--Change the 'replacement text' only.
  *
  *   For better compatibility with the Simulink Coder, the
  *   "wrapper" S-function technique is used.  This is discussed
  *   in the Simulink Coder's Manual in the Chapter titled,
  *   "Wrapper S-functions".
  *
  *  -------------------------------------------------------------------------
  * | See matlabroot/simulink/src/sfuntmpl_doc.c for a more detailed template |
  *  ------------------------------------------------------------------------- 
 * Created: Wed Jun 18 12:56:57 2014
 * 
 *
 */

#define S_FUNCTION_LEVEL 2
#define S_FUNCTION_NAME InCylinderMV
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
/* %%%-SFUNWIZ_defines_Changes_BEGIN --- EDIT HERE TO _END */
#define NUM_INPUTS          8
/* Input Port  0 */
#define IN_PORT_0_NAME      pu
#define INPUT_0_WIDTH       1
#define INPUT_DIMS_0_COL    1
#define INPUT_0_DTYPE       real_T
#define INPUT_0_COMPLEX     COMPLEX_NO
#define IN_0_FRAME_BASED    FRAME_NO
#define IN_0_BUS_BASED      0
#define IN_0_BUS_NAME       
#define IN_0_DIMS           1-D
#define INPUT_0_FEEDTHROUGH 1
#define IN_0_ISSIGNED        0
#define IN_0_WORDLENGTH      8
#define IN_0_FIXPOINTSCALING 1
#define IN_0_FRACTIONLENGTH  9
#define IN_0_BIAS            0
#define IN_0_SLOPE           0.125
/* Input Port  1 */
#define IN_PORT_1_NAME      Tu
#define INPUT_1_WIDTH       1
#define INPUT_DIMS_1_COL    1
#define INPUT_1_DTYPE       real_T
#define INPUT_1_COMPLEX     COMPLEX_NO
#define IN_1_FRAME_BASED    FRAME_NO
#define IN_1_BUS_BASED      0
#define IN_1_BUS_NAME       
#define IN_1_DIMS           1-D
#define INPUT_1_FEEDTHROUGH 1
#define IN_1_ISSIGNED        0
#define IN_1_WORDLENGTH      8
#define IN_1_FIXPOINTSCALING 1
#define IN_1_FRACTIONLENGTH  9
#define IN_1_BIAS            0
#define IN_1_SLOPE           0.125
/* Input Port  2 */
#define IN_PORT_2_NAME      Fu
#define INPUT_2_WIDTH       1
#define INPUT_DIMS_2_COL    1
#define INPUT_2_DTYPE       real_T
#define INPUT_2_COMPLEX     COMPLEX_NO
#define IN_2_FRAME_BASED    FRAME_NO
#define IN_2_BUS_BASED      0
#define IN_2_BUS_NAME       
#define IN_2_DIMS           1-D
#define INPUT_2_FEEDTHROUGH 1
#define IN_2_ISSIGNED        0
#define IN_2_WORDLENGTH      8
#define IN_2_FIXPOINTSCALING 1
#define IN_2_FRACTIONLENGTH  9
#define IN_2_BIAS            0
#define IN_2_SLOPE           0.125
/* Input Port  3 */
#define IN_PORT_3_NAME      pd
#define INPUT_3_WIDTH       1
#define INPUT_DIMS_3_COL    1
#define INPUT_3_DTYPE       real_T
#define INPUT_3_COMPLEX     COMPLEX_NO
#define IN_3_FRAME_BASED    FRAME_NO
#define IN_3_BUS_BASED      0
#define IN_3_BUS_NAME       
#define IN_3_DIMS           1-D
#define INPUT_3_FEEDTHROUGH 1
#define IN_3_ISSIGNED        0
#define IN_3_WORDLENGTH      8
#define IN_3_FIXPOINTSCALING 1
#define IN_3_FRACTIONLENGTH  9
#define IN_3_BIAS            0
#define IN_3_SLOPE           0.125
/* Input Port  4 */
#define IN_PORT_4_NAME      Td
#define INPUT_4_WIDTH       1
#define INPUT_DIMS_4_COL    1
#define INPUT_4_DTYPE       real_T
#define INPUT_4_COMPLEX     COMPLEX_NO
#define IN_4_FRAME_BASED    FRAME_NO
#define IN_4_BUS_BASED      0
#define IN_4_BUS_NAME       
#define IN_4_DIMS           1-D
#define INPUT_4_FEEDTHROUGH 1
#define IN_4_ISSIGNED        0
#define IN_4_WORDLENGTH      8
#define IN_4_FIXPOINTSCALING 1
#define IN_4_FRACTIONLENGTH  9
#define IN_4_BIAS            0
#define IN_4_SLOPE           0.125
/* Input Port  5 */
#define IN_PORT_5_NAME      Fd
#define INPUT_5_WIDTH       1
#define INPUT_DIMS_5_COL    1
#define INPUT_5_DTYPE       real_T
#define INPUT_5_COMPLEX     COMPLEX_NO
#define IN_5_FRAME_BASED    FRAME_NO
#define IN_5_BUS_BASED      0
#define IN_5_BUS_NAME       
#define IN_5_DIMS           1-D
#define INPUT_5_FEEDTHROUGH 1
#define IN_5_ISSIGNED        0
#define IN_5_WORDLENGTH      8
#define IN_5_FIXPOINTSCALING 1
#define IN_5_FRACTIONLENGTH  9
#define IN_5_BIAS            0
#define IN_5_SLOPE           0.125
/* Input Port  6 */
#define IN_PORT_6_NAME      omegae
#define INPUT_6_WIDTH       1
#define INPUT_DIMS_6_COL    1
#define INPUT_6_DTYPE       real_T
#define INPUT_6_COMPLEX     COMPLEX_NO
#define IN_6_FRAME_BASED    FRAME_NO
#define IN_6_BUS_BASED      0
#define IN_6_BUS_NAME       
#define IN_6_DIMS           1-D
#define INPUT_6_FEEDTHROUGH 1
#define IN_6_ISSIGNED        0
#define IN_6_WORDLENGTH      8
#define IN_6_FIXPOINTSCALING 1
#define IN_6_FRACTIONLENGTH  9
#define IN_6_BIAS            0
#define IN_6_SLOPE           0.125
/* Input Port  7 */
#define IN_PORT_7_NAME      throttle
#define INPUT_7_WIDTH       1
#define INPUT_DIMS_7_COL    1
#define INPUT_7_DTYPE       real_T
#define INPUT_7_COMPLEX     COMPLEX_NO
#define IN_7_FRAME_BASED    FRAME_NO
#define IN_7_BUS_BASED      0
#define IN_7_BUS_NAME       
#define IN_7_DIMS           1-D
#define INPUT_7_FEEDTHROUGH 1
#define IN_7_ISSIGNED        0
#define IN_7_WORDLENGTH      8
#define IN_7_FIXPOINTSCALING 1
#define IN_7_FRACTIONLENGTH  9
#define IN_7_BIAS            0
#define IN_7_SLOPE           0.125

#define NUM_OUTPUTS          9
/* Output Port  0 */
#define OUT_PORT_0_NAME      dmu
#define OUTPUT_0_WIDTH       1
#define OUTPUT_DIMS_0_COL    1
#define OUTPUT_0_DTYPE       real_T
#define OUTPUT_0_COMPLEX     COMPLEX_NO
#define OUT_0_FRAME_BASED    FRAME_NO
#define OUT_0_BUS_BASED      0
#define OUT_0_BUS_NAME       
#define OUT_0_DIMS           1-D
#define OUT_0_ISSIGNED        1
#define OUT_0_WORDLENGTH      8
#define OUT_0_FIXPOINTSCALING 1
#define OUT_0_FRACTIONLENGTH  3
#define OUT_0_BIAS            0
#define OUT_0_SLOPE           0.125
/* Output Port  1 */
#define OUT_PORT_1_NAME      deu
#define OUTPUT_1_WIDTH       1
#define OUTPUT_DIMS_1_COL    1
#define OUTPUT_1_DTYPE       real_T
#define OUTPUT_1_COMPLEX     COMPLEX_NO
#define OUT_1_FRAME_BASED    FRAME_NO
#define OUT_1_BUS_BASED      0
#define OUT_1_BUS_NAME       
#define OUT_1_DIMS           1-D
#define OUT_1_ISSIGNED        1
#define OUT_1_WORDLENGTH      8
#define OUT_1_FIXPOINTSCALING 1
#define OUT_1_FRACTIONLENGTH  3
#define OUT_1_BIAS            0
#define OUT_1_SLOPE           0.125
/* Output Port  2 */
#define OUT_PORT_2_NAME      dmbu
#define OUTPUT_2_WIDTH       1
#define OUTPUT_DIMS_2_COL    1
#define OUTPUT_2_DTYPE       real_T
#define OUTPUT_2_COMPLEX     COMPLEX_NO
#define OUT_2_FRAME_BASED    FRAME_NO
#define OUT_2_BUS_BASED      0
#define OUT_2_BUS_NAME       
#define OUT_2_DIMS           1-D
#define OUT_2_ISSIGNED        1
#define OUT_2_WORDLENGTH      8
#define OUT_2_FIXPOINTSCALING 1
#define OUT_2_FRACTIONLENGTH  3
#define OUT_2_BIAS            0
#define OUT_2_SLOPE           0.125
/* Output Port  3 */
#define OUT_PORT_3_NAME      dmd
#define OUTPUT_3_WIDTH       1
#define OUTPUT_DIMS_3_COL    1
#define OUTPUT_3_DTYPE       real_T
#define OUTPUT_3_COMPLEX     COMPLEX_NO
#define OUT_3_FRAME_BASED    FRAME_NO
#define OUT_3_BUS_BASED      0
#define OUT_3_BUS_NAME       
#define OUT_3_DIMS           1-D
#define OUT_3_ISSIGNED        1
#define OUT_3_WORDLENGTH      8
#define OUT_3_FIXPOINTSCALING 1
#define OUT_3_FRACTIONLENGTH  3
#define OUT_3_BIAS            0
#define OUT_3_SLOPE           0.125
/* Output Port  4 */
#define OUT_PORT_4_NAME      ded
#define OUTPUT_4_WIDTH       1
#define OUTPUT_DIMS_4_COL    1
#define OUTPUT_4_DTYPE       real_T
#define OUTPUT_4_COMPLEX     COMPLEX_NO
#define OUT_4_FRAME_BASED    FRAME_NO
#define OUT_4_BUS_BASED      0
#define OUT_4_BUS_NAME       
#define OUT_4_DIMS           1-D
#define OUT_4_ISSIGNED        1
#define OUT_4_WORDLENGTH      8
#define OUT_4_FIXPOINTSCALING 1
#define OUT_4_FRACTIONLENGTH  3
#define OUT_4_BIAS            0
#define OUT_4_SLOPE           0.125
/* Output Port  5 */
#define OUT_PORT_5_NAME      dmbd
#define OUTPUT_5_WIDTH       1
#define OUTPUT_DIMS_5_COL    1
#define OUTPUT_5_DTYPE       real_T
#define OUTPUT_5_COMPLEX     COMPLEX_NO
#define OUT_5_FRAME_BASED    FRAME_NO
#define OUT_5_BUS_BASED      0
#define OUT_5_BUS_NAME       
#define OUT_5_DIMS           1-D
#define OUT_5_ISSIGNED        1
#define OUT_5_WORDLENGTH      8
#define OUT_5_FIXPOINTSCALING 1
#define OUT_5_FRACTIONLENGTH  3
#define OUT_5_BIAS            0
#define OUT_5_SLOPE           0.125
/* Output Port  6 */
#define OUT_PORT_6_NAME      Tqe
#define OUTPUT_6_WIDTH       1
#define OUTPUT_DIMS_6_COL    1
#define OUTPUT_6_DTYPE       real_T
#define OUTPUT_6_COMPLEX     COMPLEX_NO
#define OUT_6_FRAME_BASED    FRAME_NO
#define OUT_6_BUS_BASED      0
#define OUT_6_BUS_NAME       
#define OUT_6_DIMS           1-D
#define OUT_6_ISSIGNED        1
#define OUT_6_WORDLENGTH      8
#define OUT_6_FIXPOINTSCALING 1
#define OUT_6_FRACTIONLENGTH  3
#define OUT_6_BIAS            0
#define OUT_6_SLOPE           0.125
/* Output Port  7 */
#define OUT_PORT_7_NAME      vol_eff
#define OUTPUT_7_WIDTH       1
#define OUTPUT_DIMS_7_COL    1
#define OUTPUT_7_DTYPE       real_T
#define OUTPUT_7_COMPLEX     COMPLEX_NO
#define OUT_7_FRAME_BASED    FRAME_NO
#define OUT_7_BUS_BASED      0
#define OUT_7_BUS_NAME       
#define OUT_7_DIMS           1-D
#define OUT_7_ISSIGNED        1
#define OUT_7_WORDLENGTH      8
#define OUT_7_FIXPOINTSCALING 1
#define OUT_7_FRACTIONLENGTH  3
#define OUT_7_BIAS            0
#define OUT_7_SLOPE           0.125
/* Output Port  8 */
#define OUT_PORT_8_NAME      pe
#define OUTPUT_8_WIDTH       1
#define OUTPUT_DIMS_8_COL    1
#define OUTPUT_8_DTYPE       real_T
#define OUTPUT_8_COMPLEX     COMPLEX_NO
#define OUT_8_FRAME_BASED    FRAME_NO
#define OUT_8_BUS_BASED      0
#define OUT_8_BUS_NAME       
#define OUT_8_DIMS           1-D
#define OUT_8_ISSIGNED        1
#define OUT_8_WORDLENGTH      8
#define OUT_8_FIXPOINTSCALING 1
#define OUT_8_FRACTIONLENGTH  3
#define OUT_8_BIAS            0
#define OUT_8_SLOPE           0.125

#define NPARAMS              13
/* Parameter  1 */
#define PARAMETER_0_NAME      fs
#define PARAMETER_0_DTYPE     real_T
#define PARAMETER_0_COMPLEX   COMPLEX_NO
/* Parameter  2 */
#define PARAMETER_1_NAME      Vd
#define PARAMETER_1_DTYPE     real_T
#define PARAMETER_1_COMPLEX   COMPLEX_NO
/* Parameter  3 */
#define PARAMETER_2_NAME      LHV
#define PARAMETER_2_DTYPE     real_T
#define PARAMETER_2_COMPLEX   COMPLEX_NO
/* Parameter  4 */
#define PARAMETER_3_NAME      Pe_nom
#define PARAMETER_3_DTYPE     real_T
#define PARAMETER_3_COMPLEX   COMPLEX_NO
/* Parameter  5 */
#define PARAMETER_4_NAME      SFC
#define PARAMETER_4_DTYPE     real_T
#define PARAMETER_4_COMPLEX   COMPLEX_NO
/* Parameter  6 */
#define PARAMETER_5_NAME      vol_eff_coeff1
#define PARAMETER_5_DTYPE     real_T
#define PARAMETER_5_COMPLEX   COMPLEX_NO
/* Parameter  7 */
#define PARAMETER_6_NAME      vol_eff_coeff2
#define PARAMETER_6_DTYPE     real_T
#define PARAMETER_6_COMPLEX   COMPLEX_NO
/* Parameter  8 */
#define PARAMETER_7_NAME      T_pe
#define PARAMETER_7_DTYPE     real_T
#define PARAMETER_7_COMPLEX   COMPLEX_NO
/* Parameter  9 */
#define PARAMETER_8_NAME      nstroke
#define PARAMETER_8_DTYPE     real_T
#define PARAMETER_8_COMPLEX   COMPLEX_NO
/* Parameter  10 */
#define PARAMETER_9_NAME      m_f_cyc_max
#define PARAMETER_9_DTYPE     real_T
#define PARAMETER_9_COMPLEX   COMPLEX_NO
/* Parameter  11 */
#define PARAMETER_10_NAME      C1
#define PARAMETER_10_DTYPE     real_T
#define PARAMETER_10_COMPLEX   COMPLEX_NO
/* Parameter  12 */
#define PARAMETER_11_NAME      p_a_inf
#define PARAMETER_11_DTYPE     real_T
#define PARAMETER_11_COMPLEX   COMPLEX_NO
/* Parameter  13 */
#define PARAMETER_12_NAME      Pe0
#define PARAMETER_12_DTYPE     real_T
#define PARAMETER_12_COMPLEX   COMPLEX_NO

#define SAMPLE_TIME_0        CONTINUOUS_SAMPLE_TIME //INHERITED_SAMPLE_TIME
#define NUM_DISC_STATES      0
#define DISC_STATES_IC       [0]
#define NUM_CONT_STATES      1
#define CONT_STATES_IC       [Pe0]

#define SFUNWIZ_GENERATE_TLC 1
#define SOURCEFILES "__SFB__GetThdynCombGasZach.c"
#define PANELINDEX           6
#define USE_SIMSTRUCT        0
#define SHOW_COMPILE_STEPS   0                   
#define CREATE_DEBUG_MEXFILE 1
#define SAVE_CODE_ONLY       0
#define SFUNWIZ_REVISION     3.0
/* %%%-SFUNWIZ_defines_Changes_END --- EDIT HERE TO _BEGIN */
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
#include "simstruc.h"
#define PARAM_DEF0(S) ssGetSFcnParam(S, 0)
#define PARAM_DEF1(S) ssGetSFcnParam(S, 1)
#define PARAM_DEF2(S) ssGetSFcnParam(S, 2)
#define PARAM_DEF3(S) ssGetSFcnParam(S, 3)
#define PARAM_DEF4(S) ssGetSFcnParam(S, 4)
#define PARAM_DEF5(S) ssGetSFcnParam(S, 5)
#define PARAM_DEF6(S) ssGetSFcnParam(S, 6)
#define PARAM_DEF7(S) ssGetSFcnParam(S, 7)
#define PARAM_DEF8(S) ssGetSFcnParam(S, 8)
#define PARAM_DEF9(S) ssGetSFcnParam(S, 9)
#define PARAM_DEF10(S) ssGetSFcnParam(S, 10)
#define PARAM_DEF11(S) ssGetSFcnParam(S, 11)
#define PARAM_DEF12(S) ssGetSFcnParam(S, 12)

#define IS_PARAM_DOUBLE(pVal) (mxIsNumeric(pVal) && !mxIsLogical(pVal) &&\
!mxIsEmpty(pVal) && !mxIsSparse(pVal) && !mxIsComplex(pVal) && mxIsDouble(pVal))

extern void InCylinderMV_Outputs_wrapper(const real_T *pu,
                          const real_T *Tu,
                          const real_T *Fu,
                          const real_T *pd,
                          const real_T *Td,
                          const real_T *Fd,
                          const real_T *omegae,
                          const real_T *throttle,
                          real_T *dmu,
                          real_T *deu,
                          real_T *dmbu,
                          real_T *dmd,
                          real_T *ded,
                          real_T *dmbd,
                          real_T *Tqe,
                          real_T *vol_eff ,
                          real_T *pe,
			   const real_T *xC,
                          const real_T  *fs, const int_T  p_width0, 
                          const real_T  *Vd, const int_T  p_width1, 
                          const real_T  *LHV, const int_T  p_width2, 
                          const real_T  *Pe_nom, const int_T  p_width3, 
                          const real_T  *SFC, const int_T  p_width4, 
                          const real_T  *vol_eff_coeff1, const int_T  p_width5, 
                          const real_T  *vol_eff_coeff2, const int_T  p_width6, 
                          const real_T  *T_pe, const int_T  p_width7, 
                          const real_T  *nstroke, const int_T  p_width8, 
                          const real_T  *m_f_cyc_max, const int_T  p_width9, 
                          const real_T  *C1, const int_T  p_width10, 
                          const real_T  *p_a_inf, const int_T  p_width11, 
                          const real_T  *Pe0, const int_T p_width12);
extern void InCylinderMV_Derivatives_wrapper(const real_T *pu,
                          const real_T *Tu,
                          const real_T *Fu,
                          const real_T *pd,
                          const real_T *Td,
                          const real_T *Fd,
                          const real_T *omegae,
                          const real_T *throttle,
                          const real_T *dmu,
                          const real_T *deu,
                          const real_T *dmbu,
                          const real_T *dmd,
                          const real_T *ded,
                          const real_T *dmbd,
                          const real_T *Tqe,
                          const real_T *vol_eff,
                          real_T *dx ,
                          real_T *xC, 
                          const real_T  *fs,  const int_T  p_width0,
                          const real_T  *Vd,  const int_T  p_width1,
                          const real_T  *LHV,  const int_T  p_width2,
                          const real_T  *Pe_nom,  const int_T  p_width3,
                          const real_T  *SFC,  const int_T  p_width4,
                          const real_T  *vol_eff_coeff1,  const int_T  p_width5,
                          const real_T  *vol_eff_coeff2,  const int_T  p_width6,
                          const real_T  *T_pe,  const int_T  p_width7,
                          const real_T  *nstroke,  const int_T  p_width8,
                          const real_T  *m_f_cyc_max,  const int_T  p_width9,
                          const real_T  *C1,  const int_T  p_width10,
                          const real_T  *p_a_inf,  const int_T  p_width11,
                           const real_T *Pe0, const int_T  p_width12);

/*====================*
 * S-function methods *
 *====================*/
#define MDL_CHECK_PARAMETERS
 #if defined(MDL_CHECK_PARAMETERS) && defined(MATLAB_MEX_FILE)
   /* Function: mdlCheckParameters =============================================
     * Abstract:
     *    Validate our parameters to verify they are okay.
     */
    static void mdlCheckParameters(SimStruct *S)
    {
     int paramIndex  = 0;
     bool validParam = false;
     /* All parameters must match the S-function Builder Dialog */
     

	 {
	  const mxArray *pVal0 = ssGetSFcnParam(S,0);
	  if (!IS_PARAM_DOUBLE(pVal0)) {
	    validParam = true;
	    paramIndex = 0;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal1 = ssGetSFcnParam(S,1);
	  if (!IS_PARAM_DOUBLE(pVal1)) {
	    validParam = true;
	    paramIndex = 1;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal2 = ssGetSFcnParam(S,2);
	  if (!IS_PARAM_DOUBLE(pVal2)) {
	    validParam = true;
	    paramIndex = 2;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal3 = ssGetSFcnParam(S,3);
	  if (!IS_PARAM_DOUBLE(pVal3)) {
	    validParam = true;
	    paramIndex = 3;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal4 = ssGetSFcnParam(S,4);
	  if (!IS_PARAM_DOUBLE(pVal4)) {
	    validParam = true;
	    paramIndex = 4;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal5 = ssGetSFcnParam(S,5);
	  if (!IS_PARAM_DOUBLE(pVal5)) {
	    validParam = true;
	    paramIndex = 5;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal6 = ssGetSFcnParam(S,6);
	  if (!IS_PARAM_DOUBLE(pVal6)) {
	    validParam = true;
	    paramIndex = 6;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal7 = ssGetSFcnParam(S,7);
	  if (!IS_PARAM_DOUBLE(pVal7)) {
	    validParam = true;
	    paramIndex = 7;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal8 = ssGetSFcnParam(S,8);
	  if (!IS_PARAM_DOUBLE(pVal8)) {
	    validParam = true;
	    paramIndex = 8;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal9 = ssGetSFcnParam(S,9);
	  if (!IS_PARAM_DOUBLE(pVal9)) {
	    validParam = true;
	    paramIndex = 9;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal10 = ssGetSFcnParam(S,10);
	  if (!IS_PARAM_DOUBLE(pVal10)) {
	    validParam = true;
	    paramIndex = 10;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal11 = ssGetSFcnParam(S,11);
	  if (!IS_PARAM_DOUBLE(pVal11)) {
	    validParam = true;
	    paramIndex = 11;
	    goto EXIT_POINT;
	  }
	 }

	 {
	  const mxArray *pVal12 = ssGetSFcnParam(S,12);
	  if (!IS_PARAM_DOUBLE(pVal12)) {
	    validParam = true;
	    paramIndex = 12;
	    goto EXIT_POINT;
	  }
	 }
      
     EXIT_POINT:
      if (validParam) {
          char parameterErrorMsg[1024];
          sprintf(parameterErrorMsg, "The data type and or complexity of parameter  %d does not match the "
                  "information specified in the S-function Builder dialog. "
                  "For non-double parameters you will need to cast them using int8, int16, "
                  "int32, uint8, uint16, uint32 or boolean.", paramIndex + 1);
	  ssSetErrorStatus(S,parameterErrorMsg);
      }
	return;
    }
 #endif /* MDL_CHECK_PARAMETERS */
/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */
static void mdlInitializeSizes(SimStruct *S)
{

    DECL_AND_INIT_DIMSINFO(inputDimsInfo);
    DECL_AND_INIT_DIMSINFO(outputDimsInfo);
    ssSetNumSFcnParams(S, NPARAMS);  /* Number of expected parameters */
      #if defined(MATLAB_MEX_FILE)
	if (ssGetNumSFcnParams(S) == ssGetSFcnParamsCount(S)) {
	  mdlCheckParameters(S);
	  if (ssGetErrorStatus(S) != NULL) {
	    return;
	  }
	 } else {
	   return; /* Parameter mismatch will be reported by Simulink */
	 }
      #endif

    ssSetNumContStates(S, NUM_CONT_STATES);
    ssSetNumDiscStates(S, NUM_DISC_STATES);

    if (!ssSetNumInputPorts(S, NUM_INPUTS)) return;
    /*Input Port 0 */
    ssSetInputPortWidth(S,  0, INPUT_0_WIDTH); /* */
    ssSetInputPortDataType(S, 0, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  0, INPUT_0_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 0, INPUT_0_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 0, 1); /*direct input signal access*/

    /*Input Port 1 */
    ssSetInputPortWidth(S,  1, INPUT_1_WIDTH); /* */
    ssSetInputPortDataType(S, 1, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  1, INPUT_1_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 1, INPUT_1_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 1, 1); /*direct input signal access*/

    /*Input Port 2 */
    ssSetInputPortWidth(S,  2, INPUT_2_WIDTH); /* */
    ssSetInputPortDataType(S, 2, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  2, INPUT_2_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 2, INPUT_2_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 2, 1); /*direct input signal access*/

    /*Input Port 3 */
    ssSetInputPortWidth(S,  3, INPUT_3_WIDTH); /* */
    ssSetInputPortDataType(S, 3, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  3, INPUT_3_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 3, INPUT_3_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 3, 1); /*direct input signal access*/

    /*Input Port 4 */
    ssSetInputPortWidth(S,  4, INPUT_4_WIDTH); /* */
    ssSetInputPortDataType(S, 4, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  4, INPUT_4_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 4, INPUT_4_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 4, 1); /*direct input signal access*/

    /*Input Port 5 */
    ssSetInputPortWidth(S,  5, INPUT_5_WIDTH); /* */
    ssSetInputPortDataType(S, 5, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  5, INPUT_5_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 5, INPUT_5_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 5, 1); /*direct input signal access*/

    /*Input Port 6 */
    ssSetInputPortWidth(S,  6, INPUT_6_WIDTH); /* */
    ssSetInputPortDataType(S, 6, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  6, INPUT_6_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 6, INPUT_6_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 6, 1); /*direct input signal access*/

    /*Input Port 7 */
    ssSetInputPortWidth(S,  7, INPUT_7_WIDTH); /* */
    ssSetInputPortDataType(S, 7, SS_DOUBLE);
    ssSetInputPortComplexSignal(S,  7, INPUT_7_COMPLEX);
    ssSetInputPortDirectFeedThrough(S, 7, INPUT_7_FEEDTHROUGH);
    ssSetInputPortRequiredContiguous(S, 7, 1); /*direct input signal access*/


    if (!ssSetNumOutputPorts(S, NUM_OUTPUTS)) return;
    /* Output Port 0 */
    ssSetOutputPortWidth(S, 0, OUTPUT_0_WIDTH);
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 0, OUTPUT_0_COMPLEX);
    /* Output Port 1 */
    ssSetOutputPortWidth(S, 1, OUTPUT_1_WIDTH);
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 1, OUTPUT_1_COMPLEX);
    /* Output Port 2 */
    ssSetOutputPortWidth(S, 2, OUTPUT_2_WIDTH);
    ssSetOutputPortDataType(S, 2, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 2, OUTPUT_2_COMPLEX);
    /* Output Port 3 */
    ssSetOutputPortWidth(S, 3, OUTPUT_3_WIDTH);
    ssSetOutputPortDataType(S, 3, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 3, OUTPUT_3_COMPLEX);
    /* Output Port 4 */
    ssSetOutputPortWidth(S, 4, OUTPUT_4_WIDTH);
    ssSetOutputPortDataType(S, 4, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 4, OUTPUT_4_COMPLEX);
    /* Output Port 5 */
    ssSetOutputPortWidth(S, 5, OUTPUT_5_WIDTH);
    ssSetOutputPortDataType(S, 5, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 5, OUTPUT_5_COMPLEX);
    /* Output Port 6 */
    ssSetOutputPortWidth(S, 6, OUTPUT_6_WIDTH);
    ssSetOutputPortDataType(S, 6, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 6, OUTPUT_6_COMPLEX);
    /* Output Port 7 */
    ssSetOutputPortWidth(S, 7, OUTPUT_7_WIDTH);
    ssSetOutputPortDataType(S, 7, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 7, OUTPUT_7_COMPLEX);
    /* Output Port 8 */
    ssSetOutputPortWidth(S, 8, OUTPUT_8_WIDTH);
    ssSetOutputPortDataType(S, 8, SS_DOUBLE);
    ssSetOutputPortComplexSignal(S, 8, OUTPUT_8_COMPLEX);
    
    ssSetNumSampleTimes(S, 1);
    ssSetNumRWork(S, 0);
    ssSetNumIWork(S, 0);
    ssSetNumPWork(S, 0);
    ssSetNumModes(S, 0);
    ssSetNumNonsampledZCs(S, 0);

    /* Take care when specifying exception free code - see sfuntmpl_doc.c */
    ssSetOptions(S, (SS_OPTION_EXCEPTION_FREE_CODE |
                     SS_OPTION_USE_TLC_WITH_ACCELERATOR | 
		     SS_OPTION_WORKS_WITH_CODE_REUSE));
}

# define MDL_SET_INPUT_PORT_FRAME_DATA
static void mdlSetInputPortFrameData(SimStruct  *S, 
                                     int_T      port,
                                     Frame_T    frameData)
{
    ssSetInputPortFrameData(S, port, frameData);
}
/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy  the sample time.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, SAMPLE_TIME_0);
    ssSetOffsetTime(S, 0, 0.0);
}
#define MDL_INITIALIZE_CONDITIONS
 /* Function: mdlInitializeConditions ========================================
  * Abstract:
  *    Initialize the states
  */
 static void mdlInitializeConditions(SimStruct *S)
 {
   
   real_T *xC   = ssGetContStates(S);
    
    
    xC[0] = (*mxGetPr(ssGetSFcnParam(S, 12)));
 }
#define MDL_SET_INPUT_PORT_DATA_TYPE
static void mdlSetInputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetInputPortDataType( S, 0, dType);
}
#define MDL_SET_OUTPUT_PORT_DATA_TYPE
static void mdlSetOutputPortDataType(SimStruct *S, int port, DTypeId dType)
{
    ssSetOutputPortDataType(S, 0, dType);
}

#define MDL_SET_DEFAULT_PORT_DATA_TYPES
static void mdlSetDefaultPortDataTypes(SimStruct *S)
{
  ssSetInputPortDataType( S, 0, SS_DOUBLE);
 ssSetOutputPortDataType(S, 0, SS_DOUBLE);
}
/* Function: mdlOutputs =======================================================
 *
*/
static void mdlOutputs(SimStruct *S, int_T tid)
{
    const real_T   *pu  = (const real_T*) ssGetInputPortSignal(S,0);
    const real_T   *Tu  = (const real_T*) ssGetInputPortSignal(S,1);
    const real_T   *Fu  = (const real_T*) ssGetInputPortSignal(S,2);
    const real_T   *pd  = (const real_T*) ssGetInputPortSignal(S,3);
    const real_T   *Td  = (const real_T*) ssGetInputPortSignal(S,4);
    const real_T   *Fd  = (const real_T*) ssGetInputPortSignal(S,5);
    const real_T   *omegae  = (const real_T*) ssGetInputPortSignal(S,6);
    const real_T   *throttle  = (const real_T*) ssGetInputPortSignal(S,7);
    real_T        *dmu  = (real_T *)ssGetOutputPortRealSignal(S,0);
    real_T        *deu  = (real_T *)ssGetOutputPortRealSignal(S,1);
    real_T        *dmbu  = (real_T *)ssGetOutputPortRealSignal(S,2);
    real_T        *dmd  = (real_T *)ssGetOutputPortRealSignal(S,3);
    real_T        *ded  = (real_T *)ssGetOutputPortRealSignal(S,4);
    real_T        *dmbd  = (real_T *)ssGetOutputPortRealSignal(S,5);
    real_T        *Tqe  = (real_T *)ssGetOutputPortRealSignal(S,6);
    real_T        *vol_eff  = (real_T *)ssGetOutputPortRealSignal(S,7);
    real_T        *pe = (real_T *)ssGetOutputPortRealSignal(S,8);
    const real_T   *xC = ssGetContStates(S);
    const int_T   p_width0  = mxGetNumberOfElements(PARAM_DEF0(S));
    const int_T   p_width1  = mxGetNumberOfElements(PARAM_DEF1(S));
    const int_T   p_width2  = mxGetNumberOfElements(PARAM_DEF2(S));
    const int_T   p_width3  = mxGetNumberOfElements(PARAM_DEF3(S));
    const int_T   p_width4  = mxGetNumberOfElements(PARAM_DEF4(S));
    const int_T   p_width5  = mxGetNumberOfElements(PARAM_DEF5(S));
    const int_T   p_width6  = mxGetNumberOfElements(PARAM_DEF6(S));
    const int_T   p_width7  = mxGetNumberOfElements(PARAM_DEF7(S));
    const int_T   p_width8  = mxGetNumberOfElements(PARAM_DEF8(S));
    const int_T   p_width9  = mxGetNumberOfElements(PARAM_DEF9(S));
    const int_T   p_width10  = mxGetNumberOfElements(PARAM_DEF10(S));
    const int_T   p_width11  = mxGetNumberOfElements(PARAM_DEF11(S));
    const int_T   p_width12  = mxGetNumberOfElements(PARAM_DEF12(S));
    const real_T  *fs  = (const real_T *)mxGetData(PARAM_DEF0(S));
    const real_T  *Vd  = (const real_T *)mxGetData(PARAM_DEF1(S));
    const real_T  *LHV  = (const real_T *)mxGetData(PARAM_DEF2(S));
    const real_T  *Pe_nom  = (const real_T *)mxGetData(PARAM_DEF3(S));
    const real_T  *SFC  = (const real_T *)mxGetData(PARAM_DEF4(S));
    const real_T  *vol_eff_coeff1  = (const real_T *)mxGetData(PARAM_DEF5(S));
    const real_T  *vol_eff_coeff2  = (const real_T *)mxGetData(PARAM_DEF6(S));
    const real_T  *T_pe  = (const real_T *)mxGetData(PARAM_DEF7(S));
    const real_T  *nstroke  = (const real_T *)mxGetData(PARAM_DEF8(S));
    const real_T  *m_f_cyc_max  = (const real_T *)mxGetData(PARAM_DEF9(S));
    const real_T  *C1  = (const real_T *)mxGetData(PARAM_DEF10(S));
    const real_T  *p_a_inf  = (const real_T *)mxGetData(PARAM_DEF11(S));
    const real_T  *Pe0  = (const real_T *)mxGetData(PARAM_DEF12(S));

    InCylinderMV_Outputs_wrapper(pu, Tu, Fu, pd, Td, Fd, omegae, throttle, dmu, deu, dmbu, dmd, ded, dmbd, Tqe, vol_eff, pe, xC, fs, p_width0, Vd, p_width1, LHV, p_width2, Pe_nom, p_width3, SFC, p_width4, vol_eff_coeff1, p_width5, vol_eff_coeff2, p_width6, T_pe, p_width7, nstroke, p_width8, m_f_cyc_max, p_width9, C1, p_width10, p_a_inf, p_width11, Pe0, p_width12);
}

#define MDL_DERIVATIVES  /* Change to #undef to remove function */
/* Function: mdlDerivatives =================================================
   * Abstract:
   *    In this function, you compute the S-function block's derivatives.
   *    The derivatives are placed in the derivative vector, ssGetdX(S).
   */
  static void mdlDerivatives(SimStruct *S)
  {
    const real_T   *pu  = (const real_T*) ssGetInputPortSignal(S,0);
    const real_T   *Tu  = (const real_T*) ssGetInputPortSignal(S,1);
    const real_T   *Fu  = (const real_T*) ssGetInputPortSignal(S,2);
    const real_T   *pd  = (const real_T*) ssGetInputPortSignal(S,3);
    const real_T   *Td  = (const real_T*) ssGetInputPortSignal(S,4);
    const real_T   *Fd  = (const real_T*) ssGetInputPortSignal(S,5);
    const real_T   *omegae  = (const real_T*) ssGetInputPortSignal(S,6);
    const real_T   *throttle  = (const real_T*) ssGetInputPortSignal(S,7);
    real_T         *dx  = ssGetdX(S);
    real_T         *xC  = ssGetContStates(S);
    real_T        *dmu  = (real_T *) ssGetOutputPortRealSignal(S,0);
    real_T        *deu  = (real_T *) ssGetOutputPortRealSignal(S,1);
    real_T        *dmbu  = (real_T *) ssGetOutputPortRealSignal(S,2);
    real_T        *dmd  = (real_T *) ssGetOutputPortRealSignal(S,3);
    real_T        *ded  = (real_T *) ssGetOutputPortRealSignal(S,4);
    real_T        *dmbd  = (real_T *) ssGetOutputPortRealSignal(S,5);
    real_T        *Tqe  = (real_T *) ssGetOutputPortRealSignal(S,6);
    real_T        *vol_eff  = (real_T *) ssGetOutputPortRealSignal(S,7);
    const int_T   p_width0  = mxGetNumberOfElements(PARAM_DEF0(S));
    const int_T   p_width1  = mxGetNumberOfElements(PARAM_DEF1(S));
    const int_T   p_width2  = mxGetNumberOfElements(PARAM_DEF2(S));
    const int_T   p_width3  = mxGetNumberOfElements(PARAM_DEF3(S));
    const int_T   p_width4  = mxGetNumberOfElements(PARAM_DEF4(S));
    const int_T   p_width5  = mxGetNumberOfElements(PARAM_DEF5(S));
    const int_T   p_width6  = mxGetNumberOfElements(PARAM_DEF6(S));
    const int_T   p_width7  = mxGetNumberOfElements(PARAM_DEF7(S));
    const int_T   p_width8  = mxGetNumberOfElements(PARAM_DEF8(S));
    const int_T   p_width9  = mxGetNumberOfElements(PARAM_DEF9(S));
    const int_T   p_width10  = mxGetNumberOfElements(PARAM_DEF10(S));
    const int_T   p_width11  = mxGetNumberOfElements(PARAM_DEF11(S));
    const int_T   p_width12  = mxGetNumberOfElements(PARAM_DEF12(S));
    const real_T  *fs  = (const real_T *)mxGetData(PARAM_DEF0(S));
    const real_T  *Vd  = (const real_T *)mxGetData(PARAM_DEF1(S));
    const real_T  *LHV  = (const real_T *)mxGetData(PARAM_DEF2(S));
    const real_T  *Pe_nom  = (const real_T *)mxGetData(PARAM_DEF3(S));
    const real_T  *SFC  = (const real_T *)mxGetData(PARAM_DEF4(S));
    const real_T  *vol_eff_coeff1  = (const real_T *)mxGetData(PARAM_DEF5(S));
    const real_T  *vol_eff_coeff2  = (const real_T *)mxGetData(PARAM_DEF6(S));
    const real_T  *T_pe  = (const real_T *)mxGetData(PARAM_DEF7(S));
    const real_T  *nstroke  = (const real_T *)mxGetData(PARAM_DEF8(S));
    const real_T  *m_f_cyc_max  = (const real_T *)mxGetData(PARAM_DEF9(S));
    const real_T  *C1  = (const real_T *)mxGetData(PARAM_DEF10(S));
    const real_T  *p_a_inf  = (const real_T *)mxGetData(PARAM_DEF11(S));
    const real_T  *Pe0  = (const real_T *)mxGetData(PARAM_DEF12(S));

    InCylinderMV_Derivatives_wrapper(pu, Tu, Fu, pd, Td, Fd, omegae, throttle, dmu, deu, dmbu, dmd, ded, dmbd, Tqe, vol_eff, dx,  xC, fs, p_width0, Vd, p_width1, LHV, p_width2, Pe_nom, p_width3, SFC, p_width4, vol_eff_coeff1, p_width5, vol_eff_coeff2, p_width6, T_pe, p_width7, nstroke, p_width8, m_f_cyc_max, p_width9, C1, p_width10, p_a_inf, p_width11, Pe0, p_width12);
}

/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{
}
#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif


