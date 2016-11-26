/*
 * Thruster.cpp
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 13, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#include "Thruster.h"

Thruster::Thruster(const double &ratedPower) {
	_ratedPower = ratedPower;
}

Thruster::~Thruster() {
}

double Thruster::getPower() const{
	return _load;
}


double Thruster::getPowerAvailable() const{
	return _powerAvailable;
}

void Thruster::setPower(double load) {
	_load = load;
}

double Thruster::getPowerRated() const{
	return _ratedPower;
}

void Thruster::setFLRPowerAvailable(double powerAvaiable) {
	_powerAvailable = powerAvaiable;
}
