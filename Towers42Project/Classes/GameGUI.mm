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
		
		
		selectOffensiveTowers = [CCSprite spriteWithFile:@"towerOffensiveSelector.png"];
		selectOffensiveTowers.position = ccp(160,67);
		selectOffensiveTowers.opacity = 0;
		[spriteElements addObject:selectOffensiveTowers];
		
		
	}
	return self;
}

- (void) towerSelected:(Tower*) t{
	if(t!=NULL){
		selectTowerType.opacity = 255;
		currentState = IN_TOWER_TYPE_SELECTION_MENU;
	}else {
		selectTowerType.opacity = 0;
		currentState = BEGINING_STATE;
	}
}

- (bool) seedWaiting{
	return currentState == IN_TOWER_TYPE_SELECTION_MENU;
}

- (bool) seedWaitingAndclickInOffensive:(int)x :(int)y{
	return (x<160 && y<100 && y>40);
}

- (void) activateOffensiveTowerSelector{
	currentState = IN_TOWER_OFFENSIVE_SELECTION_MENU;
	selectTowerType.opacity = 0;
	selectOffensiveTowers.opacity = 255;
}

- (bool) offensiveWaiting{
	return currentState == IN_TOWER_OFFENSIVE_SELECTION_MENU;
}

- (bool) offensiveWaitingAndclickInPellet:(int)x :(int)y{
	return (y<100 && y>40 && x>15 && x<60);
}

- (bool) offensiveWaitingAndclickInMissile:(int)x :(int)y{
	return (y<100 && y>40 && x>85 && x<140);	
}

@end
