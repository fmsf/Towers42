//
//  Controller.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Controller.h"
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

- (NSMutableArray*) getCreeeps{
	return creeps;
}

- (NSMutableArray*) getTowers{
	return towers;
}

- (bool) execute:(float) delta {
	
	for ( Creep* c in creeps) {
		[c updatePosition: delta];
	}
	
	return true;
}

- (bool) setNewLevel:(Level*) n_level {
	mapPath			= [n_level getLevelPath];
	pathLenght		= [n_level getLevelPathLenght];
	pathTransform	= [n_level getLevelTransform];
	
	/*
	 *Process waypoint directions
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
		v_lenght = 1/v_lenght;
		
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
		// code here
		//mapPath = [[NSMutableArray alloc] init];
		//mapDir	= [[NSMutableArray alloc] init];
		creeps	= [[NSMutableArray alloc] init];
		
		newLvl = [[Level alloc] init];
		
		[self setNewLevel:newLvl];
		
		[creeps addObject:[[CreepNormal alloc] init]];//[NSMutableArray arrayWithObjects:[[CreepNormal alloc] init],nil];
		
		NSValue* val = [mapPath objectAtIndex:0];
		
		for (Creep* c in creeps) {
			[c initStuff:self :0];
			[c setPosition: [val CGPointValue]];
		}
		
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

- (bool) isReady{
	return ready;
}

- (void)dealloc {
	// release here
	/*[mapPath	release];
	[mapDir		release];
	[creeps		release];*/
	
    [super dealloc];
}

@end
