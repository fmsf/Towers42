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

@protocol BulletSelector

- (Bullet*) createNewBullet;

@end


@interface Tower : Entity <BulletSelector>{
    int price;
	float radius;
	Creep* target;
	bool isSeed;
	CCSprite* turret;
	NSMutableArray* bullets;
	float shootTimer;
	float shootSpeed;
	NSMutableArray* creepList;
}


- (void) setCreepList:(NSMutableArray*) ptr;
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
<<<<<<< HEAD
- (int) getPrice;
=======
- (Creep*) getTarget;

>>>>>>> 3940450ce4cdff25fa664e932410b3f6896bc615




@end
