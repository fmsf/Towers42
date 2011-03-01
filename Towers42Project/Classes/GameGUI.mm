//
//  GameGUI.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/1/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "GameGUI.h"


@implementation GameGUI


- (NSMutableArray*) getElements{
	return spriteElements;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		spriteElements = [[NSMutableArray alloc] init];
		
		CCSprite* menuSprite = [CCSprite spriteWithFile:@"menuMockUp.png"];
		menuSprite.position = ccp(160,50);
		
		[spriteElements addObject:menuSprite];
		
	}
	return self;
}

@end
