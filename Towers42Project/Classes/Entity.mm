//
//  Entity.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Entity.h"


@implementation Entity

- (void) inScene:(bool)_b{
	addedToScene = _b;
}

- (bool) isInSceen{
	return addedToScene;
}

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
	CCSprite* mysprite = (CCSprite*)[textures objectAtIndex:currentFrame];
	mysprite.position = point;
	if(spriteSelector!=NULL){
		spriteSelector.position = point;
	}
}

- (CCSprite*) getSprite{
	CCSprite* mysprite = (CCSprite*)[textures objectAtIndex:currentFrame];
	return mysprite;
}

- (NSMutableArray*) getTextures{
	return textures;
}

- (CCSprite*) getSelector{
	return spriteSelector;
}

- (void) animate:(ccTime) dt{
	/* TODO: decide animation style
	 */
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		currentFrame = 0;
		addedToScene = false;
		textures = [[NSMutableArray alloc] init];

	}
	return self;
}

- (void)dealloc {
	// release here
	for(CCSprite* s in textures){
		s.opacity = 0;
	}
	spriteSelector.opacity = 0;
	
	[textures dealloc];
    [super dealloc];
}


@end

