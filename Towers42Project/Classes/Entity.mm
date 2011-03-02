//
//  Entity.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Entity.h"


@implementation Entity


- (int) getStatus{
	return active;
}

- (void) setRotation:(float) n_rotation {
	rotation = n_rotation;
}

- (float) getRotation {
	return rotation;
}

- (void) setStatus:(int) new_status{
	active = new_status;
}

- (CGPoint) getPosition{
	return position;
}

- (void) setPosition:(CGPoint) point{
	position = point;
}

- (CCSprite*) getSprite{
	CCSprite* mysprite = (CCSprite*)[textures objectAtIndex:currentFrame];
	return mysprite;
}

- (void) animate:(ccTime) dt{
	/* TODO: decide animation style
	 */
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		currentFrame = 0;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}


@end

