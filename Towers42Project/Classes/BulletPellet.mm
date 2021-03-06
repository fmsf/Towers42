//
//  BulletPellet.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/23/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "BulletPellet.h"


@implementation BulletPellet

- (id)init {
	
    if ((self=[super init])) {
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"stuff_circle.png"];
		firstSprite.scale = 0.25;
		[textures addObject:firstSprite];
		velocity = 2.0f;
		damage = 1.0f;
		armorPenetration = 0;
		splash_radius = 0;
		onScreen = false;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
