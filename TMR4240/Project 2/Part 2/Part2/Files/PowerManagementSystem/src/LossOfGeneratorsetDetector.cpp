/*
 * LossOfGeneratorsetDetector.cpp
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 13, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#include "LossOfGeneratorsetDetector.h"

LossOfGeneratorSetDetector::LossOfGeneratorSetDetector(const PowerPlant* p) :
		FaultDetector(p) {
}

LossOfGeneratorSetDetector::~LossOfGeneratorSetDetector() {
}

bool LossOfGeneratorSetDetector::detect(vector<bool> &affectedBus) {
	bool hasDisconnected = false;
	for (unsigned int j = 0; j < _p->getNumberOfBus(); j++) {
		const Bus* s = _p->getBus(j);
		affectedBus[j] = false;
		for (unsigned int i = 0; i < s->getNumberOfGeneratorSets(); i++) {
			if (s->getGeneratorSet(i)->hasDisconnected()){
				hasDisconnected = true;
				affectedBus[j] = true;
			}
		}
	}
	return hasDisconnected;
}

