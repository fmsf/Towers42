//
//  GameGUI.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/1/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "GameGUI.h"

@implementation GameGUI

- (NSMutableArray*) setWaveList:(NSMutableArray*) ptr{
	NSMutableArray* sprites = [[NSMutableArray alloc] init];
	waveList = ptr;
	float inc_x = 0;
	for(Wave* wave in waveList){
		CCSprite* creepSprite = [CCSprite spriteWithFile:[[wave getWaveClass] getMainSpriteName]];
		float _x = [wave getTimeTillWave]*SECONDS_IN_PX + CREEP_BAR_LEFT_OFFSET;
		inc_x += _x;
		creepSprite.position = ccp(inc_x,CREEP_BAR_Y_IN_PX);
		[wave addSprite:creepSprite];
		[sprites addObject:creepSprite];
        [creepSprite release];
	}
	return sprites;
	
}


- (void) updateWaveList {
    int numWaves = [waveList count];
    
    if ( numWaves == 0) {
        return ;
    }
    
    Wave* wave = [waveList objectAtIndex:0];
    
    CCSprite* creepSprite;
    
    float offset = [wave getTimeTillWave];
    float _x = offset * SECONDS_IN_PX + CREEP_BAR_LEFT_OFFSET;
    
    creepSprite = [wave getSprite];
    creepSprite.position = ccp(_x, CREEP_BAR_Y_IN_PX);
    
    if(offset<0) {
        creepSprite.opacity = 0;
    }
    
    for (int i=1; i<numWaves; i++) {
        wave =  [waveList objectAtIndex:i];
        
        creepSprite = [wave getSprite];
        offset += [wave getWaveInterval];
        
		_x = offset * SECONDS_IN_PX + CREEP_BAR_LEFT_OFFSET;
        
		creepSprite.position = ccp(_x, CREEP_BAR_Y_IN_PX);
        
        if(offset<0) {
            creepSprite.opacity = 0;
        }
    }
}



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
        selectOffensiveTowers.opacity = 0;
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

- (bool) offensiveWaitingAndclickInLaser:(int)x :(int)y{
	return (y<100 && y>40 && x>160 && x<200);	
}

@end
