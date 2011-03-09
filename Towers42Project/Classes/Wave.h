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
	
	int size;			// number of creeps to be spawned
	Creep* seed;		// type of creep to be spawned
	int spawnInterval;	// time interval between creep spawn
	
	float curr_time;
	Controller* c_ref;
	
	int num_launched;
	
	CGPoint spawnPoint;
}

- (void) initStuff:(Controller*) contr:(Creep*) instance:(int) n_size;

- (Creep*) getWaveClass;
- (int)   getWaveSize;

- (void) update:(float) d_time;

@end
