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
	curr_time += d_time;
	
	if ( curr_time >= spawnInterval && num_launched < 5) {
		Creep* nc = [[[seed class] alloc] init];
		
		[nc initStuff:c_ref : 0.0f];
		[nc setPosition: spawnPoint];
		
		[[c_ref getCreeps] addObject: nc];
		
		curr_time = 0;
		num_launched++;
	}
}

- (void) initStuff:(Controller*) contr:(Creep*) instance:(int) n_size {
	c_ref = contr;
	seed = instance;
	size = n_size;
	num_launched = 1;
	
	spawnInterval = 1.0f;
	curr_time = 0.0f;
	
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
