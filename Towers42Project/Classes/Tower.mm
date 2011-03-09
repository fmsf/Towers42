//
//  Tower.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Tower.h"


@implementation Tower
- (id)init {
	
    if ((self=[super init])) {
		// code here
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
