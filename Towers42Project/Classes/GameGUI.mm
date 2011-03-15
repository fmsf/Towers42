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
		
		menuSprite = [CCSprite spriteWithFile:@"menuMockUp.png"];
		menuSprite.position = ccp(160,50);
		[spriteElements addObject:menuSprite];
		
		selectTowerType = [CCSprite spriteWithFile:@"towerOffensiveDeffensiveOptions.png"];
		selectTowerType.position = ccp(160,67);
		selectTowerType.opacity = 0;
		[spriteElements addObject:selectTowerType];
		
		
		
	}
	return self;
}

- (void) towerSelected:(Tower*) t{
	if(t!=NULL){
		selectTowerType.opacity = 255;
	}else {
		selectTowerType.opacity = 0;
	}
}

@end
