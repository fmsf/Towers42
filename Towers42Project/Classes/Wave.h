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
	
	float* c_timer;			// reference to controller's timer object
	
	float	spawnInterval;	// time interval between creep spawn
	float	waveInterval;	// time interval between wave spawn
	
	int		size;			// number of creeps to be spawned
	int		num_waves;		// number of waves to be launched
	int		num_launched;	// number of units already spawned
	
	//float	wave_timer;		// wave timer
	float	unit_timer;		// unit timer
	
	CGPoint spawnPoint;		// point in which the creeps will be spawned
	
	int waveIndex;				// current wave index
	NSMutableArray* waveTimes;	// contains wave release times
}

- (void) setWaveInterval:(NSMutableArray*) wave_intv;
- (void) setWaveInterval:(float) wave_intv: (float) timeToSpawn: (int) num_waves;

- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv;

- (Creep*) getWaveClass;
- (int)   getWaveSize;

- (void) update:(float) d_time;


- (void) powerSpeed;

@end
