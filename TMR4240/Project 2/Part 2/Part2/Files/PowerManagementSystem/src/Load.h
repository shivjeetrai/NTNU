/*
 * Load.h
 *
 *  Copyright: 	NTNU, Trondheim, Norway
 *  Created:  	May 13, 2013	Torstein Ingebrigtsen Bø
 *  Revised:	<date>	<author> <description>
 *		   		<date>	<author> <description>
 */

#ifndef LOAD_H_
#define LOAD_H_

/** \brief Class for generic loads */
class Load {
public:
	Load();
	virtual ~Load();
	virtual double getDesiredLoad() const;
	virtual double getLoad() const;
	virtual double getPowerAvailable() const;
	virtual void setLoad(double load);
	virtual void setDesiredLoad(double desiredLoad);
	virtual void setPowerAvailable(double);
private:
	double _loadDesired;
	double _load;
	double _powerAvailable;
};

#endif /* LOAD_H_ */
