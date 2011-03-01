//
//  Creep.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface Creep : Entity {
	// mrda que quiseres
	NSMutableArray* mapPath;
	int targetPathNode;
	
	float pathTransform;
	float velocity;
	float armor;
	float hp;
}

- (void) initStuff:(NSMutableArray*) n_path:(float) n_transform;

- (void) updatePosition:(float) d_time;
- (void) receiveAttack:(float) damage: (float) armorPenetration;

@end
