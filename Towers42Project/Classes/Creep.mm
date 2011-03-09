//
//  Creep.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <math.h>
#import "Creep.h"
#import "defs.h"
#import "Controller.h"

@implementation Creep

- (void) initStuff:(Controller*) n_controller:(float) n_transform {
	c_ref			= n_controller;
	pathTransform	= n_transform;
	waypointIndex	= 0;
	
	waypoint		= [[[c_ref getMapPath] objectAtIndex:waypointIndex+1] CGPointValue];
	moveVector		= [[[c_ref getMapDir]  objectAtIndex:waypointIndex] CGPointValue];
	
	moveVector.x *= velocity;
	moveVector.y *= velocity;
}

- (bool) updatePosition:(float) d_time {
	int p_delta = 0; // box around waypoint that defines it as being reached
	
	CGPoint prev;
	
	int distToWaypoint = abs(position.x - waypoint.x) + abs( position.y - waypoint.y );
	
	// Check if reached current waypoint
	if ( distToWaypoint <= p_delta ) {
		// Check if we did not reach the end of the path
		if (waypointIndex != [c_ref getPathLenght] ) {
			// we haven't so continue to next waypoint
			waypointIndex++;
			
			position.x = waypoint.x;
			position.y = waypoint.y;
			
			NSValue *val	= [[c_ref getMapPath] objectAtIndex:waypointIndex+1];
			waypoint		= [val CGPointValue]; // new waypoint coordinates
			
			val			= [[c_ref getMapDir] objectAtIndex:waypointIndex];
			moveVector	= [val CGPointValue]; // new waypoint direction
			
			// calculate 
			rotation = CC_RADIANS_TO_DEGREES(ccpAngle(ccp(0,1), moveVector));
			
			// multiply by velocity to get final movement vector (per second)
			moveVector.x *= velocity;
			moveVector.y *= velocity;
			
#ifdef GRAVE_DEBUG			
			NSLog(@"New waypoint defined");
#endif
			
		} else {
			// reached the end of the path
			NSLog(@"Reached the end of the path");
			return false;
		}
	}
	
	prev.x = position.x;
	prev.y = position.y;
	
	// Perform movement
	position.x += moveVector.x * d_time;
	position.y += moveVector.y * d_time;
	
	if ( prev.x < waypoint.x && position.x > waypoint.x ||
		 prev.y < waypoint.y && position.y > waypoint.y	||
		 prev.x > waypoint.x && position.x < waypoint.x ||
		 prev.y > waypoint.y && position.y < waypoint.y	) {
		position.y = waypoint.y;
		position.x = waypoint.x;
	}
	
	return true;
}

- (void) receiveAttack:(float) damage: (float) armorPenetration{
	
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
