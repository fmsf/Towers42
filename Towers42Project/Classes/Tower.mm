//
//  Tower.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Tower.h"


@implementation Tower



- (void) setRadius:(int) _radius{
	radius = _radius;
}


- (int) getRadius{
	return radius;
}

- (void) setTarget:(Creep *)_target{
	CGPoint targetPosition = [_target getPosition];
	if(target==NULL){
		if(targetPosition.x - position.x + targetPosition.y - position.y <= radius){
			target = _target;
		}
	}
}

- (bool) tryToSelectByTouch:(int)x :(int) y{
#ifdef FMSF_DEBUG
	NSLog(@"%d-%d %d-%d < %f",x,position.x,y,position.y,TOWER_THRESHOLD*TOWER_THRESHOLD);
#endif
	if(abs(x-position.x)*abs(x-position.x)+abs(y-position.y)*abs(y-position.y)<TOWER_THRESHOLD*TOWER_THRESHOLD){
		spriteSelector.opacity = 255;
		return true;
	}else {
		spriteSelector.opacity = 0;
		return false;
	}
}

- (void) disableTower{
	spriteSelector.opacity = 0;
}

- (bool) isSeed{
	return isSeed;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		spriteSelector = [CCSprite spriteWithFile:@"towerSelector.png"];
		spriteSelector.scale=0.5;
		spriteSelector.position = ccp(100,160);
		spriteSelector.opacity = 0;
		position = ccp(100,160);
		isSeed = true;
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"towerseed.jpg"];
		firstSprite.scale = 0.5;
		firstSprite.position = ccp(100,160);
		[textures addObject:firstSprite];
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
