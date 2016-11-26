#define NTHRUSTERS 5
#include <cmath>
void singularityCost(double epsilon, double varrho, const bool isOn[], const double* x, double* f){
bool isOn1 = isOn[0];
bool isOn2 = isOn[1];
bool isOn3 = isOn[2];
bool isOn4 = isOn[3];
bool isOn5 = isOn[4];
double u1 = x[0];
double u2 = x[1];
double u3 = x[2];
double u4 = x[3];
double u5 = x[4];
double u6 = x[5];
double u7 = x[6];
double u8 = x[7];
double u9 = x[8];
double u10 = x[9];
*f =  varrho/(epsilon+((isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*(u3*u3)*(u10*u10)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*(u4*u4)*(u9*u9)*1.344171538826643E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*(u3*u3)*(u9*u9)*1.936189621061678E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*(u4*u4)*(u10*u10)*1.936189621061678E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*(u3*u3)*(u10*u10)*1.344171538826643E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*(u4*u4)*(u9*u9)*2.272281052544824E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*(u3*u3)*(u10*u10)*3.495331468714119E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*(u4*u4)*(u9*u9)*3.495331468714119E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*u3*u4*(u10*u10)*4.195028958218235E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*u3*u4*(u9*u9)*4.195028958218235E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*(u4*u4)*u9*u10*3.22649716094879E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*(u3*u3)*u9*u10*3.22649716094879E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*u3*u4*(u9*u9)*3.22649716094879E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*u3*u4*(u10*u10)*3.22649716094879E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*(u3*u3)*u9*u10*4.195028958218235E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*(u4*u4)*u9*u10*4.195028958218235E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u1*u1)*u3*u4*u9*u10*3.495331468714119E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*(u2*u2)*u3*u4*u9*u10*3.495331468714119E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn5*isOn5)*u1*u2*u3*u4*u9*u10*8.443824777989536E10)/((u1*u1+u2*u2)*(u3*u3+u4*u4)*(u9*u9+u10*u10)))+varrho/(epsilon+((isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*(u7*u7)*(u10*u10)*1.584893561238607E10+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*(u8*u8)*(u9*u9)*1.756811097110812E8+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*(u7*u7)*(u9*u9)*1.936189621061678E10+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*(u8*u8)*(u10*u10)*1.936189621061678E10+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*(u7*u7)*(u10*u10)*1.756811097110812E8+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*(u8*u8)*(u9*u9)*1.584893561238607E10+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*(u7*u7)*(u10*u10)*3.337279488519629E9+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*(u8*u8)*(u9*u9)*3.337279488519629E9-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*u7*u8*(u10*u10)*3.503515071329177E10-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*u7*u8*(u9*u9)*3.503515071329177E10-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*(u8*u8)*u9*u10*3.688641707941791E9-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*(u7*u7)*u9*u10*3.688641707941791E9-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*u7*u8*(u9*u9)*3.688641707941791E9-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*u7*u8*(u10*u10)*3.688641707941791E9-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*(u7*u7)*u9*u10*3.503515071329177E10-(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*(u8*u8)*u9*u10*3.503515071329177E10+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u5*u5)*u7*u8*u9*u10*3.337279488519629E9+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*(u6*u6)*u7*u8*u9*u10*3.337279488519629E9+(isOn3*isOn3)*(isOn4*isOn4)*(isOn5*isOn5)*u5*u6*u7*u8*u9*u10*7.077302586542787E10)/((u5*u5+u6*u6)*(u7*u7+u8*u8)*(u9*u9+u10*u10)))+varrho/(epsilon+((isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u3*u3)*(u6*u6)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*(u5*u5)*(u7*u7)*6.174388223119963E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*(u5*u5)*(u7*u7)*1.584893561238607E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u3*u3)*(u6*u6)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*(u5*u5)*(u8*u8)*6.174388223119963E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*(u6*u6)*(u7*u7)*1.584893561238607E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*(u5*u5)*(u8*u8)*1.584893561238607E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*(u6*u6)*(u7*u7)*6.174388223119963E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u4*u4)*(u5*u5)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u5*u5)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u5*u5)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*(u6*u6)*(u8*u8)*1.584893561238607E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*(u6*u6)*(u8*u8)*6.174388223119963E8+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u4*u4)*(u5*u5)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u6*u6)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u6*u6)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u5*u5)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u5*u5)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u5*u5)*(u8*u8)*6.174388223119963E8+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u6*u6)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u5*u5)*(u7*u7)*1.584893561238607E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u6*u6)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u6*u6)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u6*u6)*(u8*u8)*1.584893561238607E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u5*u5)*(u8*u8)*6.174388223119963E8+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u6*u6)*(u7*u7)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u5*u5)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u6*u6)*(u7*u7)*6.174388223119963E8+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u5*u5)*(u7*u7)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u5*u5)*(u8*u8)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u5*u5)*(u7*u7)*1.584893561238607E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u6*u6)*(u8*u8)*1.584893561238607E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u5*u5)*(u8*u8)*2.272281052544824E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u6*u6)*(u7*u7)*6.174388223119963E8+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u6*u6)*(u8*u8)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u6*u6)*(u7*u7)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u5*u5)*(u8*u8)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u5*u5)*(u7*u7)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u6*u6)*(u8*u8)*1.584893561238607E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u6*u6)*(u7*u7)*1.584893561238607E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u3*u3)*(u6*u6)*(u7*u7)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u4*u4)*(u5*u5)*(u7*u7)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u3*u3)*(u6*u6)*(u8*u8)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u4*u4)*(u5*u5)*(u8*u8)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u5*u5)*(u8*u8)*4.544562105089647E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u5*u5)*(u7*u7)*4.544562105089647E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*u3*u4*(u6*u6)*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*u3*u4*(u5*u5)*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u6*u6)*(u8*u8)*4.544562105089647E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u6*u6)*(u7*u7)*4.544562105089647E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u5*u5)*(u8*u8)*7.491313735374161E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u6*u6)*(u7*u7)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*u3*u4*(u6*u6)*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*u3*u4*(u5*u5)*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u5*u5)*(u8*u8)*7.491313735374161E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u6*u6)*(u7*u7)*7.491313735374161E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*u5*u6*(u7*u7)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*u5*u6*(u7*u7)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*(u4*u4)*u5*u6*(u8*u8)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*(u3*u3)*u5*u6*(u8*u8)*6.256436090750169E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*u5*u6*(u8*u8)*6.256436090750169E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*u5*u6*(u7*u7)*6.256436090750169E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*u5*u6*(u8*u8)*6.256436090750169E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*u5*u6*(u7*u7)*6.256436090750169E9-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*u5*u6*(u8*u8)*3.169787122477214E10-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*u5*u6*(u7*u7)*3.169787122477214E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*(u6*u6)*u7*u8*3.795430731552231E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*(u5*u5)*u7*u8*3.795430731552231E10-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*u5*u6*(u8*u8)*3.169787122477214E10-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*u5*u6*(u7*u7)*3.169787122477214E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*(u6*u6)*u7*u8*3.795430731552231E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*(u5*u5)*u7*u8*3.795430731552231E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*(u5*u5)*(u7*u7)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*(u5*u5)*(u8*u8)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*(u6*u6)*(u7*u7)*6.256436090750169E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*(u6*u6)*(u8*u8)*6.256436090750169E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u3*u3)*u5*u6*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u3*u3)*u5*u6*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u4*u4)*u5*u6*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*(u4*u4)*u5*u6*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*u3*u4*u5*u6*(u7*u7)*7.491313735374161E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*u5*u6*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u1*u1)*u3*u4*u5*u6*(u8*u8)*7.491313735374161E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*u3*u4*u5*u6*(u7*u7)*7.491313735374161E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*u5*u6*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*u5*u6*(u7*u7)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*(u2*u2)*u3*u4*u5*u6*(u8*u8)*7.491313735374161E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u5*u5)*u7*u8*6.256436090750169E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*u5*u6*(u8*u8)*3.795430731552231E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*u3*u4*(u5*u5)*u7*u8*4.544562105089647E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*(u6*u6)*u7*u8*6.256436090750169E9+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u5*u5)*u7*u8*6.256436090750169E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u1*u1)*u3*u4*(u6*u6)*u7*u8*4.544562105089647E10-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*u3*u4*(u5*u5)*u7*u8*4.544562105089647E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*(u6*u6)*u7*u8*6.256436090750169E9-(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*(u2*u2)*u3*u4*(u6*u6)*u7*u8*4.544562105089647E10-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*u3*u4*(u5*u5)*u7*u8*3.169787122477214E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u3*u3)*u5*u6*u7*u8*7.491313735374161E9-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*u3*u4*(u6*u6)*u7*u8*3.169787122477214E10-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*u3*u4*(u5*u5)*u7*u8*3.169787122477214E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*(u4*u4)*u5*u6*u7*u8*7.491313735374161E9-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u3*u3)*u5*u6*u7*u8*7.491313735374161E9-(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*u3*u4*(u6*u6)*u7*u8*3.169787122477214E10-(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*(u4*u4)*u5*u6*u7*u8*7.491313735374161E9+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*u5*u6*(u7*u7)*7.837836992029261E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn3*isOn3)*u1*u2*u3*u4*u5*u6*(u8*u8)*7.837836992029261E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*u3*u4*(u5*u5)*u7*u8*9.089124210179294E10+(isOn1*isOn1)*(isOn2*isOn2)*(isOn4*isOn4)*u1*u2*u3*u4*(u6*u6)*u7*u8*9.089124210179294E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u3*u3)*u5*u6*u7*u8*7.837836992029261E10+(isOn1*isOn1)*(isOn3*isOn3)*(isOn4*isOn4)*u1*u2*(u4*u4)*u5*u6*u7*u8*7.837836992029261E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u1*u1)*u3*u4*u5*u6*u7*u8*6.339574244954428E10+(isOn2*isOn2)*(isOn3*isOn3)*(isOn4*isOn4)*(u2*u2)*u3*u4*u5*u6*u7*u8*6.339574244954428E10)/((u1*u1+u2*u2)*(u3*u3+u4*u4)*(u5*u5+u6*u6)*(u7*u7+u8*u8)));
}