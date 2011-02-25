//
//  Entity.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Entity.h"


@implementation Entity


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

