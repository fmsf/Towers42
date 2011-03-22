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
	if(target==NULL){
		return false;
	}
	CGPoint targetPosition = [target getPosition];
	movementVector = ccp((targetPosition.x-position.x)*velocity,(targetPosition.y-position.y)*velocity);
	position.x += movementVector.x;
	position.y += movementVector.y;
	if([textures count]>0){
		for(CCSprite* s in textures){
			s.position = position; // BUG PARA CORRIGIR AQUI
		}
	}
	return true;
}

- (void) isOnScreen:(bool)t{
	onScreen = t;
}

- (bool) isOnScreen{
	return onScreen;
}

- (id)init {
	
    if ((self=[super init])) {
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"stuff_circle.png"];
		[textures addObject:firstSprite];
		velocity = 0.1f;
		onScreen = false;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
