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
#import "PowerUp.h"

@implementation Wave

- (void) update: (float) d_time {
	//NSLog(@"time: %f wave at:%f\n", *c_timer, [[waveTimes objectAtIndex: waveIndex] floatValue]);
	
	if (*c_timer > nextWaveAt) {
		
		if ( unit_timer < spawnInterval ) {
			
			unit_timer += d_time;
			
		} else if ( num_launched < size ) {
			
			Creep* nc = [[[seed class] alloc] init];
			
			if ([my_powerUp isPowerUp]) {
				[nc receivePowerUp:my_powerUp];
			}
			
			[nc initStuff: c_ref];
			[nc setPosition: spawnPoint];
			
			[[c_ref getCreeps] addObject: nc];
			
			[nc release];
			
			unit_timer = 0;
			num_launched++;
			
		} else {
			num_launched = 0;
			unit_timer = 0;
			waveCount++;
			
			if ([my_powerUp isPowerUp])
				[my_powerUp resetPowerUp];
			
			NSMutableArray* waveArray = [c_ref getWaves];
			
			Wave* me = [[waveArray objectAtIndex:0] retain];
			
			[waveArray removeObjectAtIndex:0];
			
			if (waveCount < num_waves) {
				[waveArray addObject: me];
			}
			
			if ([waveArray count] > 0) {
				if (!nextIsInstant)
					[[waveArray objectAtIndex:0] setNextWaveAt:	nextWaveAt];
				else 
					[[waveArray objectAtIndex:0] setNextWaveInstant: nextWaveAt];
			}
			
			[me release];
		}
	}
}

- (void) setNextWaveAt:(float) time {
	
	nextWaveAt = time + waveInterval;
}

- (void)	setNextWaveInstant:(float) time {
	nextWaveAt = time + spawnInterval;
}

- (float) getTimeTillWave {
	return nextWaveAt - (*c_timer);
}

- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv {
	c_ref = contr;
	size = n_size;
	num_launched = 0;
	waveCount = 0;
	
	nextIsInstant = false;
	
	spawnInterval = creep_intv;
	
	unit_timer = 0.0f;
	
	c_timer			= [c_ref getWaveTimer];
	
	seed = instance;
	[seed retain];
	
	NSValue *val	= [[c_ref getMapPath] objectAtIndex:0];
	spawnPoint		= [val CGPointValue];
	
	my_powerUp = [[PowerUp alloc] init];
	[my_powerUp initPowerUp];
}

- (void) setWaveInterval:(float) wave_intv: (int) n_waves {
	
	num_waves		= n_waves;
	waveInterval	= wave_intv;
	
}

- (Creep*) getWaveClass {
	return seed;
}

- (int)   getWaveSize {
	return size;
}


- (void) powerSpeed {
	[my_powerUp addSpeedModifier:5.0f];
	//NSLog(@"%f = %f\n", [[waveTimes objectAtIndex: waveIndex] floatValue], time);
}

- (void) quickSpawn {
	if (*c_timer < nextWaveAt) {
		nextWaveAt = *c_timer;
	} else {
		nextIsInstant = true;
	}
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
	}
	return self;
}

- (void)dealloc {
	// release here
	[seed		release];
	[my_powerUp release];
	
    [super dealloc];
}

@end
