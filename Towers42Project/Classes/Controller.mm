//
//  Controller.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Controller.h"
#import "CreepFast.h"
#import "CreepNormal.h"
#import "CreepSpawn.h"

@implementation Controller

- (int) getPathLenght {
	return pathLenght;
}

- (NSMutableArray*) getMapPath{
	return mapPath;
}

- (NSMutableArray*) getCreeps{
	return creeps;
}

- (NSMutableArray*) getTowers{
	return towers;
}

- (NSMutableArray*) getWaves{
	return waves;
}

- (bool) execute:(float) delta {
	
	timer		+= delta;
	waveTimer	+= delta;
	
	/*if(timer>1 && !used) {
		
		[[waves objectAtIndex:0] quickSpawn];
		
		//[[waves objectAtIndex:0] powerSpeed];
		NSLog(@"used PowerUp");
		used = true;
	}*/
	
	if ([waves count] > 0) {
		[[waves objectAtIndex:0] update: delta];
	}
	
	for ( Creep* c in creeps) {
		[c updatePosition: delta];
	}
	
	for (Tower* t in towers){
		if([t isSeed]) continue;		
		for(Creep* c in creeps){
			[t setTarget:c];
			[t updateRotation];	
		}
		[t shoot: delta];
	}
	
	for(Tower* t in towers){
		[t clearTarget];
	}

	[creeps removeObjectsInArray:elders];
	[elders removeAllObjects];
	
	return true;
}

- (void) registerDying:(Creep*) n_elder {
	
	[elders addObject: n_elder];
}

- (bool) setNewLevel:(Level*) n_level {
	mapPath			= [n_level getLevelPath];
	pathLenght		= [n_level getLevelPathLenght];
	pathTransform	= [n_level getLevelTransform];
	
	[mapPath retain];
	
	return true;
}


- (id)init {
	
    if ((self=[super init])) {
		
		towers = [[NSMutableArray alloc] init];
		// code here
		//mapPath = [[NSMutableArray alloc] init];
		//mapDir	= [[NSMutableArray alloc] init];
		creeps	= [[NSMutableArray alloc] init];
		elders	= [[NSMutableArray alloc] init];
		dead	= [[NSMutableArray alloc] init];
		
		waves	= [[NSMutableArray alloc] init];
		bullets = [[NSMutableArray alloc] init];
		
		used = false;
		
		Level* newlvl = [[Level alloc] init];
		[self setNewLevel:newlvl];
		[newlvl release];
		
		waveTimer = timer = 0;
		
		//[creeps addObject:[[CreepNormal alloc] init]];//[NSMutableArray arrayWithObjects:[[CreepNormal alloc] init],nil];
		
		Wave* wave = [[Wave alloc] init];
		
		
		CreepSpawn*     seedNormal	= [[CreepSpawn alloc] init];
		CreepFast*		seedFast	= [[CreepFast alloc] init];
		
		//- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv;
		for(int i=0;i<10;i++){
            wave = [[Wave alloc] init];
            [wave initWave: self: seedNormal :5 : 0.5f ];
            //- (void) setWaveInterval:(float) wave_intv: (int) n_waves
            [wave setWaveInterval: 5.0f: 1];
            
            [waves addObject: wave];
            
            [wave release];
            wave = [[Wave alloc] init];
            
            //n_size: (float) wave_intv: (float) creep_intv: (float) timeToSpawn
            [wave initWave: self: seedFast :5 : 0.5f ];
            [wave setWaveInterval: 5.0f: 1];		
            [waves addObject: wave];
            [wave  release];

		}
        
		[seedNormal release];
		[seedFast	release];
		
		[[waves objectAtIndex:0] setNextWaveAt: 0];
		
		ready = true;
		
	}
	return self;
}

- (float*) getTimer {
	return &timer;
}

- (float*) getWaveTimer {
	return &waveTimer;
}

- (bool) isReady{
	return ready;
}

- (void)dealloc {
	// release here
	[elders		release];
	[dead		release];
	[waves		release];
	[towers		release];
	[bullets	release];
	[mapPath	release];
	[creeps		release];
	
    [super dealloc];
}

@end
