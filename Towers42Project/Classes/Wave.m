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
	
	if (waveIndex >= num_waves) {
		return;
	}
	//NSLog(@"%f\n", [[waveTimes objectAtIndex: waveIndex] floatValue]);
	if ( *c_timer > [[waveTimes objectAtIndex: waveIndex] floatValue] ) {
		
		if ( unit_timer < spawnInterval ) {
			
			unit_timer += d_time;
			
		} else if ( num_launched < size ) {
			
			Creep* nc = [[[seed class] alloc] init];
			
			if ([my_powerUp isPowerUp]) {
				[nc receivePowerUp:my_powerUp];
			}
			
			[nc initStuff:c_ref : 0.0f];
			[nc setPosition: spawnPoint];
			
			[[c_ref getCreeps] addObject: nc];
			
			[nc release];
			
			unit_timer = 0;
			num_launched++;
			
		} else {
			num_launched = 0;
			unit_timer = 0;
			waveIndex++;
			
			if ([my_powerUp isPowerUp])
				[my_powerUp resetPowerUp];
		}
	}
}

- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv {
	c_ref = contr;
	size = n_size;
	num_launched = 0;
	
	spawnInterval = creep_intv;
	
	waveIndex = 0;
	unit_timer = 0.0f;
	
	c_timer			= [c_ref getPlayer1WaveTimer];
	
	seed = instance;
	[seed retain];
	
	NSValue *val	= [[c_ref getMapPath] objectAtIndex:0];
	spawnPoint		= [val CGPointValue];
	
	my_powerUp = [[PowerUp alloc] init];
	[my_powerUp initPowerUp];
}


- (void) setWaveInterval:(NSMutableArray*) wave_times {
	waveTimes = wave_times;
	
	[waveTimes retain];
}

- (void) setWaveInterval:(float) wave_intv: (float) timeToSpawn: (int) n_waves {
	
	num_waves = n_waves;
	
	waveTimes = [[NSMutableArray alloc] init];
	
	float t = timeToSpawn;
	
	for (int n=0; n<num_waves; n++) {
		
		[waveTimes addObject: [NSNumber numberWithFloat:t]];
		
		t += wave_intv;
	}
}

- (Creep*) getWaveClass {
	return seed;
}

- (int)   getWaveSize {
	return size;
}

- (float) getNextWaveTime {
	if (*c_timer <= [[waveTimes objectAtIndex: waveIndex] floatValue]) {
		return [[waveTimes objectAtIndex: waveIndex] floatValue];
	} else {
		NSLog(@"calculating wave displacement");
		float timeDiff = [[waveTimes objectAtIndex: waveIndex] floatValue];
		NSLog(@"start: %f", timeDiff);
		timeDiff += (size-1) * spawnInterval;
		NSLog(@"end: %f", timeDiff);
		timeDiff = [[waveTimes objectAtIndex: waveIndex+1] floatValue] - timeDiff;
		
		NSLog(@"new wave Time: %f", timeDiff);
		
		return timeDiff;
	}
}

- (void) powerSpeed {
	[my_powerUp addSpeedModifier:5.0f];
	//NSLog(@"%f = %f\n", [[waveTimes objectAtIndex: waveIndex] floatValue], time);
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
	}
	return self;
}

- (void)dealloc {
	// release here
	//[waveTimes removeAllObjects];
	[waveTimes	release];
	[seed		release];
	[my_powerUp release];
	
    [super dealloc];
}

@end
