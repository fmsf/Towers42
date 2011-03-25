//
//  MissileBullet.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/23/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "BulletMissile.h"


@implementation BulletMissile


- (id)init {
	
    if ((self=[super init])) {
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"missile.png"];
		[textures addObject:firstSprite];
		velocity = 0.5f;
		damage = 5.0f;
		armorPenetration = 0;
		splash_radius = 30;
		onScreen = false;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
