/*
 * MergeLoad.h
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 14, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#ifndef MERGELOAD_H_
#define MERGELOAD_H_

#include <vector>
#include "Load.h"

using namespace std;

/** \brief Class to merge loads in a virtual group */
template <class T>
class LoadMerger  {
public:
	LoadMerger();
	virtual ~LoadMerger();
	void addLoad(T*);
	void clear();
	double getDesiredLoad() const;
	double getLoad() const;
	double getPowerAvailable() const;
	const T* getPartLoad(const unsigned int i) const;
	T* getPartLoad(const unsigned int i);
private:
	vector<T*> _load;
};

#endif /* MERGELOAD_H_ */
