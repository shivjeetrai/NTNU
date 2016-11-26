/*
 * BatteryMerger.cpp
 *
 *  Created on: 21. jan. 2015
 *      Author: torstebo
 */

#include "BatteryMerger.h"

BatteryMerger::BatteryMerger() {
  
}

BatteryMerger::~BatteryMerger() {
}

void BatteryMerger::add(EmergencyBattery* bat){
  _batteries.push_back(bat);
}

EmergencyBattery* BatteryMerger::get(const unsigned int i){
  return _batteries[i];
}

const EmergencyBattery* BatteryMerger::get(const unsigned int i) const{
  return _batteries[i];
}

void BatteryMerger::clear() {
  _batteries.clear();
}

unsigned long BatteryMerger::size() const{
  return _batteries.size();
}

double BatteryMerger::getPowerAvailable() const{
  double pa = 0.;
  for (unsigned long i = 0; i < size(); i++){
    pa += get(i)->getPowerAvailable();
  }
  return pa;
}
double BatteryMerger::getPowerGenerated() const{
  double pg = 0.;
  for (unsigned long i = 0; i < size(); i++){
    pg += get(i)->getPowerGenerated();
  }
  return pg;
}


double BatteryMerger::getPowerGeneratedPrevious() const{
  double pa = 0.;
  for (unsigned long i = 0; i < size(); i++){
    pa += get(i)->getPowerGeneratedPrevious();
  }
  return pa;
}
