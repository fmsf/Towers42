//
//  Creep.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@class Controller;

@interface Creep : Entity {
	Controller* c_ref;
	int waypointIndex;
	
	CGPoint waypoint;
	CGPoint moveVector;
	
	float pathTransform;
	float velocity;
	float armor;
	float hp;
}

- (void) initStuff:(Controller*) n_controller:(float) n_transform;

- (bool) updatePosition:(float) d_time;
- (void) receiveAttack:(float) damage: (float) armorPenetration;

@end
