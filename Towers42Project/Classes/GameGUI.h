//
//  GameGUI.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/1/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Tower.h"

// GUI STATES
#define BEGINING_STATE 0
#define IN_TOWER_TYPE_SELECTION_MENU 1
#define IN_TOWER_OFFENSIVE_SELECTION_MENU 2

@interface GameGUI : NSObject {
	NSMutableArray* spriteElements;
	CCSprite* menuSprite;
	CCSprite* selectTowerType;
	CCSprite* selectOffensiveTowers;
	int currentState;
}

- (NSMutableArray*) getElements;
- (void) towerSelected:(Tower*) t;

// STATE HANDLER FUNCTIONS
- (bool) seedWaiting;
- (bool) seedWaitingAndclickInOffensive:(int)x :(int)y;

- (bool)offensiveWaiting;
- (void) activateOffensiveTowerSelector;
- (bool) offensiveWaitingAndclickInPellet:(int)x :(int)y;
- (bool) offensiveWaitingAndclickInMissile:(int)x :(int)y;



@end
