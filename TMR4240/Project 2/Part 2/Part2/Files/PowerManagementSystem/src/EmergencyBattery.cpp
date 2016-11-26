/*
 * EmergencyBattery.cpp
 *
 *  Created on: 20. jan. 2015
 *      Author: torstebo
 */

#include "EmergencyBattery.h"

EmergencyBattery::EmergencyBattery() : _powerAvailable(0.),_powerGenerated(0.),_powerGeneratedPrevious(0.) {
}

EmergencyBattery::~EmergencyBattery() {
}

void EmergencyBattery::updateStatus(double powerGenerated, double powerAvailable){
  _powerGeneratedPrevious = _powerGenerated;
  _powerGenerated = powerGenerated;
  _powerAvailable = powerAvailable;
}
double EmergencyBattery::getPowerAvailable() const{
  return _powerAvailable;
}
double EmergencyBattery::getPowerGenerated() const{
  return _powerGenerated;
}
/* Power generated at the previous update */
double EmergencyBattery::getPowerGeneratedPrevious() const{
  return _powerGeneratedPrevious;
}
