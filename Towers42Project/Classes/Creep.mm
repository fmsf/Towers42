//
//  Creep.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Creep.h"


@implementation Creep

- (void) initStuff:(NSMutableArray*) n_path:(float) n_transform {
	mapPath			= n_path;
	pathTransform	= n_transform;
}

- (void) updatePosition:(float) d_time {
	position.x;
	position.y;
	
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
