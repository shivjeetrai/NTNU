/*
 * Load.cpp
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 13, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#include "Load.h"

Load::Load() {
}

Load::~Load() {
}

double Load::getDesiredLoad() const{
	return _loadDesired;
}

double Load::getLoad() const{
	return _load;
}


double Load::getPowerAvailable() const{
	return _powerAvailable;
}

void Load::setLoad(double load) {
	_load = load;
}

void Load::setDesiredLoad(double desiredLoad) {
	_loadDesired = desiredLoad;
}

void Load::setPowerAvailable(double powerAvaiable) {
	_powerAvailable = powerAvaiable;
}

