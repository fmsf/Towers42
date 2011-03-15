//
//  Wave.m
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Creep.h"
#import "Wave.h"
#import "Controller.h"

@implementation Wave

- (void) update: (float) d_time {
	wave_timer += d_time;
	
	if ( wave_timer > waveInterval ) {
		
		if ( unit_timer < spawnInterval ) {
			
			unit_timer += d_time;
			
		} else if ( num_launched < size ) {
			
			Creep* nc = [[[seed class] alloc] init];
			
			[nc initStuff:c_ref : 0.0f];
			[nc setPosition: spawnPoint];
			
			[[c_ref getCreeps] addObject: nc];
			
			[nc release];
			
			unit_timer = 0;
			num_launched++;
			
		} else {
			num_launched = 0;
			wave_timer = spawnInterval * size;
			unit_timer = 0;
		}
	}
}

- (void) initStuff:(Controller*) contr:(Creep*) instance:(int) n_size: (float) wave_intv: (float) creep_intv: (float) timeToSpawn {
	c_ref = contr;
	seed = instance;
	size = n_size;
	num_launched = 0;
	
	spawnInterval = creep_intv;
	waveInterval  = wave_intv;
	
	wave_timer = timeToSpawn;
	unit_timer = 0.0f;
	
	NSValue *val	= [[c_ref getMapPath] objectAtIndex:0];
	spawnPoint		= [val CGPointValue];
}

- (Creep*) getWaveClass {
	return seed;
}

- (int)   getWaveSize {
	return size;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
