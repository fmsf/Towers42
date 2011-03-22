//
//  Tower.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "Creep.h"
#import "defs.h"
#import "Bullet.h"

@interface Tower : Entity {
	float radius;
	Creep* target;
	bool isSeed;
	CCSprite* turret;
	NSMutableArray* bullets;
	float shootTimer;
	float shootSpeed;
}

- (void) shoot:(float) delta;
- (void) setRadius:(int) _radius;
- (float) getRadius;
- (void) setTarget:(Creep*)_target;
- (bool) tryToSelectByTouch:(int)x :(int) y;
- (void) disableTower;
- (void) updateRotation;
- (NSMutableArray*) getBullets;
- (void) clearTarget;
- (void) clearTarget:(Creep*) creep;
- (bool) isSeed;





@end
