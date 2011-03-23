//
//  TestCreep.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "TestCreep.h"


@implementation TestCreep

- (void) setSprite{	
	textures = [[NSMutableArray alloc] init];
	CCSprite* creep = [CCSprite spriteWithFile:@"TestCreep.png"];
	[textures addObject:creep];
}



- (id)init {
	
    if ((self=[super init])) {
		// code here
		currentFrame = 0;
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
