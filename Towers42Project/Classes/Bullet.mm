//
//  Bullet.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/18/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet


- (void) setTarget:(Creep*)_target{
	target = _target;
}

- (bool) update{
	if(target==NULL || [target getStatus]==CREEP_DEAD || [target getStatus]== CREEP_TO_RELEASE){
		[self clearTarget];
		return false;
	}
	CGPoint targetPosition = [target getPosition];
	CGPoint distanceVector = ccp((targetPosition.x-position.x),(targetPosition.y-position.y));
	float distance = sqrt(distanceVector.x*distanceVector.x+distanceVector.y+distanceVector.y);
	movementVector = ccp((distanceVector.x/distance)*velocity,(distanceVector.y/distance)*velocity);
	position.x += movementVector.x;
	position.y += movementVector.y;
	if([textures count]>0){
		for(CCSprite* s in textures){
			s.position = position;
		}
	}
//	if(abs(movementVector.x)<1 && abs(movementVector.y) < 1){
	if(distance<=3){
		[target receiveAttack:damage :armorPenetration];
		[self clearTarget];
		return false;
	}
	return true;
}

- (void) isOnScreen:(bool)t{
	onScreen = t;
}

- (void) clearTarget{
	for(CCSprite* s in textures){
		[s removeFromParentAndCleanup:YES];
	}
	target = NULL;
}

- (bool) isOnScreen{
	return onScreen;
}

- (bool) isDead{
	return target==NULL;
}

- (id)init {
	
    if ((self=[super init])) {
/*		CCSprite* firstSprite = [CCSprite spriteWithFile:@"stuff_circle.png"];
		[textures addObject:firstSprite];
		velocity = 0.1f;
		damage = 10.0f;
		armorPenetration = 0;*/
		onScreen = false;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
