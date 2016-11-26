/*
 * EmergencyBattery.h
 *
 *  Created on: 20. jan. 2015
 *      Author: torstebo
 */

#ifndef EMERGENCYBATTERY_H_
#define EMERGENCYBATTERY_H_

class EmergencyBattery {
public:
  EmergencyBattery();
  virtual ~EmergencyBattery();
  void updateStatus(double powerGenerated, double powerAvailable);
  double getPowerAvailable() const;
  double getPowerGenerated() const;
  /* Power generated at the previous update */
  double getPowerGeneratedPrevious() const;
private:
  double _powerAvailable;
  double _powerGenerated;
  double _powerGeneratedPrevious;

};

#endif /* EMERGENCYBATTERY_H_ */
