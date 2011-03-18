//
//  Tower.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Tower.h"


@implementation Tower

- (void) updateRotation{
	if(target!=NULL){
		CGPoint targetPosition = [target getPosition];
		rotation = CC_RADIANS_TO_DEGREES(ccpAngle(ccp(0,1), ccp(targetPosition.x-position.x,targetPosition.y-position.y)));
		if(targetPosition.x < position.x){
			rotation = -rotation;
		}
		if(turret!=NULL){
			turret.rotation = rotation;
		}
	}
}

- (NSMutableArray*) getBullets{
	return bullets;
}

- (void) setRadius:(int) _radius{
	radius = _radius;
}

- (void) shoot:(float) delta{
	shootTimer -= delta;
	if(shootTimer <= 0){
		shootTimer = shootSpeed;
		if(target!=NULL){
			Bullet* b = [[Bullet alloc] init];
			[b setTarget: target];
			[b setPosition:position];
			[bullets addObject:b];
		}
	}
	for(Bullet* b in bullets){
		if(![b update]){
			target = NULL;
		}
	}
}

- (float) getRadius{
	return radius;
}

- (void) setTarget:(Creep *)_target{
	if(target!=NULL){
		CGPoint targetPosition = [_target getPosition];
		float c1 = targetPosition.x - position.x;
		float c2 = targetPosition.y - position.y;
		if( c1*c1 + c2*c2 > radius*radius){
			target=NULL;
		}
	}
	
	if(target==NULL){
		CGPoint targetPosition = [_target getPosition];
		float c1 = targetPosition.x - position.x;
		float c2 = targetPosition.y - position.y;
		if( c1*c1 + c2*c2 <= radius*radius){
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
		shootTimer = 0;
		shootSpeed = 10;
		radius = 100;
		isSeed = true;
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"towerseed.jpg"];
		firstSprite.scale = 0.5;
		firstSprite.position = ccp(100,160);
		[textures addObject:firstSprite];
		bullets = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
