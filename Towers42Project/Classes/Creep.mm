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
#import "PowerUp.h"
//#import "MyQueue.h"

#define EASE_STEPS	10
#define R_INTERVAL	0.01f

@implementation Creep

- (void) initStuff:(Controller*) n_controller:(float) n_transform {
	c_ref			= n_controller;
	pathTransform	= n_transform;
	waypointIndex	= 0;
	
	waypoint		= [[[c_ref getMapPath] objectAtIndex:waypointIndex+1] CGPointValue];
	
	moveVector = ccp(0,1);
	
	moveVector.x *= velocity;
	moveVector.y *= velocity;
}

- (bool) updatePosition:(float) d_time {
	if([self getStatus]==CREEP_DEAD){
		return false;
	}
	else if([self getStatus]==CREEP_TO_RELEASE){
		[c_ref registerDying:self];
		return false;
	}
	
	int p_delta = 0; // box around waypoint that defines it as being reached
	
	CGPoint prev;
	
	int distToWaypoint = abs(position.x - waypoint.x) + abs( position.y - waypoint.y );
	
	// Check if reached current waypoint
	if ( distToWaypoint <= p_delta ) {
		// Check if we did not reach the end of the path
		if (waypointIndex != [c_ref getPathLenght] ) {
			// we haven't so continue to next waypoint
			waypointIndex++;
			
			NSValue *val	= [[c_ref getMapPath] objectAtIndex:waypointIndex+1];
			waypoint		= [val CGPointValue]; // new waypoint coordinates
			
			CGPoint prv_move = moveVector;
			
			/*
			 * Calculate movement vector
			 */
			
			float a, b, v_lenght;
			
			moveVector.x = waypoint.x;
			moveVector.x -= position.x;
			
			
			moveVector.y = waypoint.y;
			moveVector.y -= position.y;
			
			// calculate the vectors lenght: lenght = sqrt( x*x + y*y )
			a =		moveVector.x;
			a *=	moveVector.x;
			b =		moveVector.y;
			b *=	moveVector.y;
			
			a += b;
			v_lenght = sqrt(a);
			
			// divide the vector by it's lenght to normalize it
			v_lenght = 1/v_lenght;
			
			moveVector.x *= v_lenght;
			moveVector.y *= v_lenght;
			
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
		
		rotation	+= r_Step;
		r_NextStep	+= R_INTERVAL;
		
		r_Iter++;
	}
	
	if ( prev.x < waypoint.x && position.x >= waypoint.x ||
		 prev.y < waypoint.y && position.y >= waypoint.y ||
		 prev.x > waypoint.x && position.x <= waypoint.x ||
		 prev.y > waypoint.y && position.y <= waypoint.y ) {
		
		position.y = waypoint.y;
		position.x = waypoint.x;
		
	}
	
	return true;
}

- (void) receiveAttack:(float) damage: (float) armorPenetration {
	
	hp -= damage - (armor - armorPenetration);
	if ( hp <= 0 ) {
		[self setStatus:CREEP_DEAD];
	}
}

- (void) receivePowerUp: (PowerUp*) my_power {
	hp		*= [my_power getHpModifier];
	armor	*= [my_power getArmorModifier];
	velocity *=[my_power getSpeedModifier];
}

- (float) getHPPercent{
	return ((hp / default_hp)*HP_BAR_SIZE_IN_PX);
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
