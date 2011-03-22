//
//  CreepNormal.mm
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreepFast.h"


@implementation CreepFast

- (id)init {
	
    if ((self=[super init])) {
		// code here
		default_hp = hp = 20.0f;
		armor	 = 0.0f;
		velocity = 40.0f;
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"CircleCreep.png"];
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
