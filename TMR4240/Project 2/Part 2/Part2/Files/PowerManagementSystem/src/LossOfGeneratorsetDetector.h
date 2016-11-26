/*
 * LossOfGeneratorsetDetector.h
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 13, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#ifndef LOSSOFGENERATORSETDETECTOR_H_
#define LOSSOFGENERATORSETDETECTOR_H_

#include "FaultDetector.h"

/** \brief Detector for loss of generatorSets*/
class LossOfGeneratorSetDetector: public FaultDetector {

public:
	LossOfGeneratorSetDetector(const PowerPlant* p);
	virtual ~LossOfGeneratorSetDetector();
	bool detect(vector<bool> &affectedBus);
private:

};

#endif /* LOSSOFGENERATORSETDETECTOR_H_ */
