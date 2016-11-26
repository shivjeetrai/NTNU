/*
 * FaultList.cpp
 *
 *  Created on: Jun 24, 2014
 *      Author: torstein
 */

#include "FaultList.h"
#include <float.h>

FaultList::FaultList() {
	_removeTime = DBL_MAX;
}

FaultList::~FaultList() {
	  for (iterator f = begin(); f != end(); ++f) {
	      delete *f;
	  }
}

void FaultList::removeOldFaults(double time) {
  for (iterator f = begin(); f != end(); ++f) {
    if ((*f)->getTime() + _removeTime <= time) {
      erase(f--);
    }
  }
}
