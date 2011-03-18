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

#define EASE_STEPS	10
#define R_INTERVAL	0.01f

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
			
			// Redundanct
			//position.x = waypoint.x;
			//position.y = waypoint.y;
			
			NSValue *val	= [[c_ref getMapPath] objectAtIndex:waypointIndex+1];
			waypoint		= [val CGPointValue]; // new waypoint coordinates
			
			CGPoint prv_move = moveVector;
			
			val			= [[c_ref getMapDir] objectAtIndex:waypointIndex];
			moveVector	= [val CGPointValue]; // new waypoint direction
			
			// calculate 
			float r = CC_RADIANS_TO_DEGREES(ccpAngle(ccp(0,1), moveVector));
			
			if (position.x > waypoint.x) {
				r = -r;
			}
			
			r_Iter		= 0;
			r_Step		= abs(r - rotation) / EASE_STEPS;
			r_NextStep	= (*[c_ref getTimer]) + R_INTERVAL;
			
			if (rotation > r) {
				r_Step = -r_Step;
			}
			
			// multiply by velocity to get final movement vector (per second)
			moveVector.x *= velocity;
			moveVector.y *= velocity;
			
		} else {
			// reached the end of the path
			reachedEnd = true;
			
			[c_ref registerDying:self];
			
			return false;
		}
	}
	
	prev.x = position.x;
	prev.y = position.y;
	
	// Perform movement
	position.x += moveVector.x * d_time;
	position.y += moveVector.y * d_time;
	
	// Rotate if necessary
	if ( r_Iter < EASE_STEPS && r_NextStep < (*[c_ref getTimer])) {
		
		position.x += moveVector.x * d_time * 0.5f;
		position.y += moveVector.y * d_time * 0.5f;
		
		rotation	+= r_Step;
		r_NextStep	+= R_INTERVAL;
		
		r_Iter++;
	}
	
	if ( prev.x < waypoint.x && position.x >= waypoint.x ||
		 prev.y < waypoint.y && position.y >= waypoint.y ||
		 prev.x > waypoint.x && position.x <= waypoint.x ||
		 prev.y > waypoint.y && position.y <= waypoint.y ) {
		/*
		if (waypointIndex > 4) {
			NSLog(@"(%.2f, %.2f)  (%.2f, %.2f) (%.2f, %.2f)\n", prev.x, prev.y, position.x, position.y, waypoint.x, waypoint.y);
			
			NSValue *val	= [[c_ref getMapPath] objectAtIndex:waypointIndex];
			CGPoint t		= [val CGPointValue]; // new waypoint coordinates
			
			val			= [[c_ref getMapDir] objectAtIndex:waypointIndex];
			CGPoint m	= [val CGPointValue]; // new waypoint direction
			
			NSLog(@"  start (%.2f, %.2f)  vector (%.7f, %.7f)\n", t.x, t.y, m.x, m.y);
		}
		*/
		position.y = waypoint.y;
		position.x = waypoint.x;
		
	}
	
	return true;
}

- (void) receiveAttack:(float) damage: (float) armorPenetration {
	
	hp -= damage - (armor - armorPenetration);
	
	if ( hp <= 0 ) {
		[c_ref registerDying:self];
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
	
    [super dealloc];
}

@end
