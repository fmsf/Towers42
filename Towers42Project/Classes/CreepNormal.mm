//
//  CreepNormal.mm
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreepNormal.h"


@implementation CreepNormal

- (id)init {
	
    if ((self=[super init])) {
		// code here
		hp		 = 20.0f;
		armor	 = 0.0f;
		velocity = 10.0f;
		textures = [[NSMutableArray alloc] init];
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"TriangleCreep.png"];
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
