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

#define TOWER_THRESHOLD 20

@interface Tower : Entity {
	int radius;
	Creep* target;
}

- (void) setRadius:(int) _radius;
- (int) getRadius;
- (void) setTarget:(Creep*)_target;
- (bool) tryToSelectByTouch:(int)x :(int) y;

@end
