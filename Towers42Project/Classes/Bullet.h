//
//  Bullet.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/18/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "Creep.h"

@interface Bullet : Entity {
	float velocity;
	CGPoint movementVector;
	Creep* target;
	
	
	bool onScreen;
}

- (void) setTarget:(Creep*)_target;
- (bool) update;
- (void) isOnScreen:(bool)t;
- (bool) isOnScreen;



@end