//
//  CreepSpawn.mm
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "CreepSpawn.h"
#import "CreepSpawnUnderlings.h"

@implementation CreepSpawn

- (void) onDeath {
	
	CreepSpawnUnderlings* nc = [[CreepSpawnUnderlings alloc] init];
	
	[nc initStuff: c_ref];
	CGPoint np = position;
	np.x+=10;
	[nc setPosition: np];
	[nc setWaypoint: waypointIndex];
	[[c_ref getCreeps] addObject: nc];
	
	[nc release];
	nc = [[CreepSpawnUnderlings alloc] init];
	[nc initStuff: c_ref];
	np.x-=5;
	np.y+=5;
	[nc setPosition: np];
	[nc setWaypoint: waypointIndex];
	[[c_ref getCreeps] addObject: nc];
	
	[nc release];
	
	[self setStatus:CREEP_DEAD];
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
        value = 2;
		default_hp = hp = 20.0f;
		armor	 = 0.0f;
		velocity = 10.0f;
		mainSpriteName = [NSString stringWithFormat:@"CreepSpawn.png"];
		CCSprite* firstSprite = [CCSprite spriteWithFile:mainSpriteName];
		position = ccp(100,160);
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
