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


@implementation Controller

- (int) getPathLenght {
	return pathLenght;
}

- (NSMutableArray*) getMapPath{
	return mapPath;
}

- (NSMutableArray*) getMapDir{
	return mapDir;
}

- (NSMutableArray*) getCreeps{
	return creeps;
}

- (NSMutableArray*) getTowers{
	return towers;
}

- (bool) execute:(float) delta {
	
	timer				+= delta;
	player1WaveTimer	+= delta;
	
	if(timer>1 && !used) {
		
		player1WaveTimer += [[waves objectAtIndex:0] getNextWaveTime];
		
		//[[waves objectAtIndex:0] powerSpeed];
		NSLog(@"used PowerUp");
		used = true;
	}
	
	for ( Wave* w in waves) {
		[w update: delta];
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
	
	/*
	 *	Process waypoint directions
	 */
	
	// allocate space for new direction array
	mapDir = [[NSMutableArray alloc] initWithCapacity:pathLenght];
	
	CGPoint vector;
	CGPoint start;
	CGPoint end;
	
	NSValue* val;
	
	int a, b;
	float v_lenght;
	
	// and fill it
	for (int i=1, j=0; i < pathLenght; i++, j++) {
		val = [mapPath objectAtIndex:i];
		end = [val CGPointValue];
		
		val = [mapPath objectAtIndex:j];
		start = [val CGPointValue];
		
		vector.x = end.x;
		vector.x -= start.x;
		
		vector.y = end.y;
		vector.y -= start.y;
		
		// calculate the vectors lenght: lenght = sqrt( x*x + y*y )
		a = vector.x;
		a *= vector.x;
		b = vector.y;
		b *= vector.y;
		
		a += b;
		v_lenght = sqrt(a);
		
		// divide the vector by it's lenght to normalize it
		v_lenght = 1.0f/v_lenght;
		
		vector.x *= v_lenght;
		vector.y *= v_lenght;
		
		// add to the direction array
		val = [NSValue valueWithCGPoint:vector];
		
		[mapDir addObject:val];
	}
	
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
		
		player1WaveTimer = timer = 0;
		
		//[creeps addObject:[[CreepNormal alloc] init]];//[NSMutableArray arrayWithObjects:[[CreepNormal alloc] init],nil];
		
		Wave* wave = [[Wave alloc] init];
		
		
		CreepNormal*	seedNormal	= [[CreepNormal alloc] init];
		CreepFast*		seedFast	= [[CreepFast alloc] init];
		
		//- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv;
		[wave initWave: self: seedNormal :4 : 1.0f ];
		//- (void) setWaveInterval:(float) wave_intv: (float) timeToSpawn: (int) n_waves
		[wave setWaveInterval: 10.0f: 0.0f: 2];
		
		[waves addObject: wave];
		
		[wave release];
		wave = [[Wave alloc] init];
		
		//n_size: (float) wave_intv: (float) creep_intv: (float) timeToSpawn
		[wave initWave: self: seedFast :4 : 0.4f ];
		[wave setWaveInterval: 10.0f: 20.0f: 1];
		
		[waves addObject: wave];
		
		[wave		release];
		[seedNormal release];
		[seedFast	release];
		
		/*
		NSValue* val = [mapPath objectAtIndex:0];
		
		for (Creep* c in creeps) {
			[c initStuff:self :0];
			[c setPosition: [val CGPointValue]];
		}
		*/
		/*
		mapPath = [NSMutableArray arrayWithObjects:
						[NSValue valueWithCGPoint:CGPointMake(100, 0)],
						[NSValue valueWithCGPoint:CGPointMake(100, 100)],
						[NSValue valueWithCGPoint:CGPointMake(220, 280)],
						[NSValue valueWithCGPoint:CGPointMake(220, 380)],
						nil];
		
		creeps = [NSMutableArray arrayWithObjects:[[TestCreep alloc]init],nil];
		 */
		ready = true;
		
	}
	return self;
}

- (float*) getTimer {
	return &timer;
}

- (float*) getPlayer1WaveTimer {
	return &player1WaveTimer;
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
	[mapDir		release];
	[creeps		release];
	
    [super dealloc];
}

@end
