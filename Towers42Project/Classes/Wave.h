//
//  Wave.h
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Entity.h"

@class Creep;
@class Controller;

@interface Wave : Entity {
	
	Creep*		seed;		// type of creep to be spawned
	Controller* c_ref;
	
	float	spawnInterval;	// time interval between creep spawn
	float	waveInterval;	// time interval between wave spawn
	
	int		size;			// number of creeps to be spawned
	int		num_launched;	// number of units already spawned
	
	float	wave_timer;		// wave timer
	float	unit_timer;		// unit timer
	
	CGPoint spawnPoint;		// point in which the creeps will be spawned
	
	
}

- (void) initStuff:(Controller*) contr:(Creep*) instance:(int) n_size: (float) wave_intv: (float) creep_intv: (float) timeToSpawn;

- (Creep*) getWaveClass;
- (int)   getWaveSize;

- (void) update:(float) d_time;

@end
